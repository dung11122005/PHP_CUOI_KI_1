(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    // $(window).scroll(function () {
    //     if ($(window).width() < 992) {
    //         if ($(this).scrollTop() > 55) {
    //             $('.fixed-top').addClass('shadow');
    //         } else {
    //             $('.fixed-top').removeClass('shadow');
    //         }
    //     } else {
    //         if ($(this).scrollTop() > 55) {
    //             $('.fixed-top').addClass('shadow').css('top', -55);
    //         } else {
    //             $('.fixed-top').removeClass('shadow').css('top', 0);
    //         }
    //     }
    // });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });



    $(document).ready(function () {

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        // Lấy URL từ data-url
        var updateUrl = $('#cart').data('url');
        $('.btn-plus, .btn-minus').click(function (e) {
            e.preventDefault();
            let id = $(this).data('id');
            let type = $(this).hasClass('btn-plus') ? 'increase' : 'decrease';
            let input = $('.cart-qty-input[data-cart-detail-id="' + id + '"]');
            

            $.ajax({
                url: updateUrl,
                method: 'POST',
                data: {
                    id: id,
                    type: type,
                },
                success: function (res) {
                    if (res.status === 'success') {
                        console.log(res);
                        input.val(res.quantity);
                        // Cập nhật lại tổng tiền cho sản phẩm
                        let totalPriceElement = $('.total-price[data-cart-detail-id="' + id + '"]');
                        totalPriceElement.text(res.total + ' đ');
                        // Cập nhật lại tổng tiền cho giỏ hàng
                        let totalCartElement = $('.totalPrice');
                        totalCartElement.text(res.totalPrice + ' đ');
                    }
                }
            });

        });
        
    });


    // // Edit quantity of products added to cart
    // document.getElementById('addToCartForm').addEventListener('submit', function(event) {
    //     var quantity = document.getElementById('quantityInput').value;
    //     // Cập nhật lại giá trị trong input ẩn của form với giá trị quantity
    //     var quantityInputHidden = document.createElement('input');
    //     quantityInputHidden.type = 'hidden';
    //     quantityInputHidden.name = 'quantity';
    //     quantityInputHidden.value = quantity;
    
    //     // Thêm input ẩn vào form
    //     this.appendChild(quantityInputHidden);
    // });
    
    // Attach the click event handler to the checkboxes within the OrderCart
    // $('.orderCart input').on('click', function () {
    //     $(".orderCart .form-check-input:not(:checked)").each(function () {
    //         const index = $(this).attr("data-cart-detail-index")
    //         const el = document.getElementById(`cartDetails${index}.checkbox`);
    //         $(el).val(0);
    //     });
    //     $(".orderCart .form-check-input:checked").each(function () {
    //         const index = $(this).attr("data-cart-detail-index")
    //         const el = document.getElementById(`cartDetails${index}.checkbox`);
    //         $(el).val(1);
    //     });
    // });

    // Attach the click event handler to the checkboxes within the OrderCart
    $('.orderCart input').on('click', function () {
        const index = $(this).attr("data-cart-detail-index");
        const isChecked = $(this).is(':checked');
        const el = document.getElementById(`cartDetails${index}.checkbox`);
        if (el) {
            $(el).prop('checked', isChecked).val(isChecked ? 1 : 0);
        }
    });



    function formatCurrency(value) {
        // Use the 'vi-VN' locale to format the number according to Vietnamese currency format
        // and 'VND' as the currency type for Vietnamese đồng
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0, // No decimal part for whole numbers
        });

        let formatted = formatter.format(value);
        // Replace dots with commas for thousands separator
        formatted = formatted.replace(/\./g, ',');
        return formatted;
    }

    //handle filter products
    $('#btnFilter').click(function (event) {
        event.preventDefault();

        let factoryArr = [];
        let typeArr = [];
        let priceArr = [];
        //factory filter
        $("#factoryFilter .form-check-input:checked").each(function () {
            factoryArr.push($(this).val());
        });

        //type filter
        $("#typeFilter .form-check-input:checked").each(function () {
            typeArr.push($(this).val());
        });

        //price filter
        $("#priceFilter .form-check-input:checked").each(function () {
            priceArr.push($(this).val());
        });

        //sort order
        let sortValue = $('input[name="radio-sort"]:checked').val();
        let ValueStar = $('input[name="radio-star"]:checked').val();

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        // Add or update query parameters
        searchParams.set('page', '1');
        searchParams.set('sort', sortValue);

        if (ValueStar != null) {
            searchParams.set('valueStar', ValueStar);
        }



        searchParams.delete('factory')
        searchParams.delete('type')
        searchParams.delete('price')

        if (factoryArr.length > 0) {
            searchParams.set('factory', factoryArr.join(','));
        }
        if (typeArr.length > 0) {
            searchParams.set('type', typeArr.join(','));
        }
        if (priceArr.length > 0) {
            searchParams.set('price', priceArr.join(','));
        }

        // Update the URL and reload the page
        window.location.href = currentUrl.toString();
    });



    $('#searchButton').click(function (event) {
        let searchValue = $('input[name="SearchProduct"]').val();
        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;
        searchParams.set('page', '1');
        searchParams.set('searchValue', searchValue);
        window.location.href = currentUrl.toString();
    });



    //handle auto checkbox after page loading
    // Parse the URL parameters
    const params = new URLSearchParams(window.location.search);

    // Set checkboxes for 'factory'
    if (params.has('factory')) {
        const factories = params.get('factory').split(',');
        factories.forEach(factory => {
            $(`#factoryFilter .form-check-input[value="${factory}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'type'
    if (params.has('type')) {
        const types = params.get('type').split(',');
        types.forEach(type => {
            $(`#typeFilter .form-check-input[value="${type}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'price'
    if (params.has('price')) {
        const prices = params.get('price').split(',');
        prices.forEach(price => {
            $(`#priceFilter .form-check-input[value="${price}"]`).prop('checked', true);
        });
    }

    // Set radio buttons for 'sort'
    if (params.has('sort')) {
        const sort = params.get('sort');
        $(`input[type="radio"][name="radio-sort"][value="${sort}"]`).prop('checked', true);
    }

    if (params.has('valueStar')) {
        const valueStar = params.get('valueStar');
        $(`input[type="radio"][name="radio-star"][value="${valueStar}"]`).prop('checked', true);
    }

    //////////////////////////
    // Thêm sản phẩm vào giỏ hàng từ trang chủ
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $('.btnAddToCartHomepage').click(function (e) {
            console.log("click")
            // Lấy form chứa nút được nhấn
            var form = $(this).closest('form');
                
            // Lấy giá trị từ các input trong form
            const productId = form.find('input[name="product_id"]').val();
            const quantity = form.find('input[name="quantity"]').val();
            //kiểm tra xem thông tin sản phẩm có hợp lệ không
            console.log("productId: ", productId)
            console.log("quantity: ", quantity)
            const token = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                url: `/add-product-to-cart/${productId}`,
                type: "POST",
                data: {
                    product_id: productId,
                    quantity: quantity,
                    _token: token
                },
                success: function (response) {
                    // Kiểm tra nếu server trả về 'status' là 'success'
                    if (response.status === 'success') {
                        $.toast({
                            heading: 'Giỏ hàng',
                            text: response.message,  // Lấy thông báo từ response.message
                            position: 'top-right',
                            icon: 'success'
                        });
                    }
                },
                error: function (xhr, status, error) {
                    // Xử lý lỗi nếu cần thiết
                    console.error("Error adding product to cart:", error);
                }

            });
        });
    });
    
    $('.btnAddToCartDetail').click(function (event) {
        event.preventDefault();
        if (!isLogin()) {
            $.toast({
                heading: 'Lỗi thao tác',
                text: 'Bạn cần đăng nhập tài khoản',
                position: 'top-right',
                icon: 'error'
            })
            return;
        }

        const productId = $(this).attr('data-product-id');
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        const quantity = $("#cartDetails0\\.quantity").val();
        $.ajax({
            url: `${window.location.origin}/api/add-product-to-cart`,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: "POST",
            data: JSON.stringify({ quantity: quantity, productId: productId }),
            contentType: "application/json",

            success: function (response) {
                const sum = +response;
                //update cart
                $("#sumCart").text(sum)
                //show message
                $.toast({
                    heading: 'Giỏ hàng',
                    text: 'Thêm sản phẩm vào giỏ hàng thành công',
                    position: 'top-right',

                })

            },
            error: function (response) {
                alert("có lỗi xảy ra, check code đi ba :v")
                console.log("error: ", response);
            }

        });
    });

    //Xóa sản phẩm trong giỏ hàng
    $(document).ready(function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        // Khi nhấn nút xóa sản phẩm trong giỏ hàng
        $('.btn-deleteCartDetail').click(function(e) {
            var cartDetailId = $(this).attr('id');
            console.log(cartDetailId)

    
            $.ajax({ 
                url: `/delete-cart-product/${cartDetailId}`,
                type: 'DELETE', // Sử dụng phương thức DELETE để xóa sản phẩm
                id: cartDetailId,
                success: function(response) {
                    // Xử lý khi xóa thành công
                    if (response.status === 'success') {
                        $.toast({
                            heading: 'Giỏ hàng',
                            text: 'Xóa sản phẩm thành công!',
                            position: 'top-right',
                            icon: 'success'
                        });
                        $('#cartItem' + cartDetailId).remove();
    
                    }
                },
                error: function(xhr) {
                    // Xử lý khi có lỗi
                    $.toast({
                        heading: 'Lỗi',
                        text: 'Có lỗi xảy ra khi xóa sản phẩm!',
                        position: 'top-right',
                        icon: 'error'
                    });
                    console.log("Error response:", xhr.responseText);
                }
            });
        });
    });
    
    //Kiểm tra checkbox trước khi gửi form thanh toán
    $(document).ready(function() {
        $('#checkoutForm').on('submit', function(e) {
            let isChecked = $('.cart-checkbox:checked').length > 0;
    
            if (!isChecked) {
                e.preventDefault(); // Ngăn gửi form
                $('#checkbox-error').text('Vui lòng chọn ít nhất một sản phẩm để đặt hàng.').show();
            } else {
                $('#checkbox-error').hide();
            }
        });
    });

    
    
    function isLogin() {
        const navElement = $("#navbarCollapse");
        const childLogin = navElement.find('a.a-login');
        if (childLogin.length > 0) {
            return false;
        }
        return true;
    }



})(jQuery);

