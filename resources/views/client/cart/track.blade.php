<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Fruitables - Vegetable Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <meta name="_csrf" content="{{ csrf_token() }}">
    <meta name="_csrf_header" content="X-CSRF-TOKEN">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet">

    <!--Sử dụng thư viện jQuery Toast:-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="{{ asset('lib/lightbox/css/lightbox.min.css') }}" rel="stylesheet">
    <link href="{{ asset('lib/owlcarousel/assets/owl.carousel.min.css') }}" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <style>
        .pagination {
            margin-top: 50px;
            display: inline-flex;
            gap: 5px;
        }

        .pagination .page-item .page-link {
            color: #333;
            border-radius: 20px;
            padding: 8px 16px;
            margin: 2px;
            border: 1px solid #ddd;
            transition: all 0.3s ease;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .pagination .page-item:hover .page-link {
            background-color: #f0f0f0;
            color: #007bff;
        }
    </style>
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner"
        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    @extends('client.layout.header')


    <div style="margin-top: 130px;" class="container-fluid featurs">
        <h2 class="text-center mb-4">Thông tin theo dõi đơn hàng</h2>
        @if (isset($order))
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Giá cả</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">ĐƠN HÀNG CÓ MÃ SỐ {{ $order->id }}</td>
                            <td colspan="1">
                                {{ number_format($order->total_price, 0, ',', '.') }} đ
                            </td>
                            <td colspan="2"></td>
                            <td colspan="1"></td>
                        </tr>
                        @foreach ($order->orderDetails as $orderDetail)
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img loading="lazy"
                                            src="{{ asset('storage/products/' . $orderDetail->product->product_image_url) }}"
                                            class="img-fluid me-5 rounded-circle"
                                            style="width: 80px; height: 80px; object-fit: cover;" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">
                                        <a href="/product/{{ $orderDetail->product->id }}" target="_blank">
                                            {{ $orderDetail->product->product_name }}
                                        </a>
                                    </p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">
                                        {{ number_format($orderDetail->price, 0, ',', '.') }} đ
                                    </p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <input type="text" class="form-control form-control-sm text-center border-0"
                                            value="{{ $orderDetail->quantity }}">
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">
                                        {{ number_format($orderDetail->price * $orderDetail->quantity, 0, ',', '.') }} đ
                                    </p>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>


            <div class="container">
                <div class="row g-4">
                    <!-- Đơn hàng đang được xử lý -->
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i
                                    class="far fa-thumbs-up fa-3x  @if($order->order_status == 'pending') text-primary @else text-white @endif "></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>ĐẶT HÀNG THÀNH CÔNG</h5>
                                <p class="mb-0">Đơn hàng sẽ sớm được xác nhận</p>
                            </div>
                        </div>
                    </div>
                    <!-- Đơn hàng đang được vận chuyển -->
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i
                                    class="fas fa-car-side fa-3x  @if($order->order_status == 'shipping') text-primary @else text-white @endif "></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>ĐANG ĐƯỢC VẬN CHUYỂN</h5>
                                <p class="mb-0">Đơn hàng sắp đến tay bạn</p>
                            </div>
                        </div>
                    </div>
                    <!-- Đơn hàng đã được giao -->
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i
                                    class="fas fa-people-carry fa-3x @if($order->order_status == 'complete') text-primary @else text-white @endif "></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>HÀNG ĐÃ ĐƯỢC GIAO</h5>
                                <p class="mb-0">Đổi trả miễn phí</p>
                            </div>
                        </div>
                    </div>
                    <!-- Đơn hàng đã bị hủy -->
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i
                                    class="fas fa-times-circle fa-3x  @if($order->order_status == 'cancel') text-primary @else text-white @endif "></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>ĐƠN HÀNG ĐÃ HỦY</h5>
                                <p class="mb-0">Liên hệ nếu gặp vấn đề</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @else
            <div class="container text-center">
                <h3>Đơn hàng không tồn tại</h3>
                <p>Vui lòng kiểm tra lại mã đơn hàng hoặc liên hệ với chúng tôi để biết thêm thông tin.</p>
            </div>
        @endif
    </div>



    @extends('client.layout.footer')




    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
            class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('lib/easing/easing.min.js') }}"></script>
    <script src="{{ asset('lib/waypoints/waypoints.min.js') }}"></script>
    <script src="{{ asset('lib/lightbox/js/lightbox.min.js') }}"></script>
    <script src="{{ asset('lib/owlcarousel/owl.carousel.min.js') }}"></script>

    <!-- Template Javascript -->
    <script src="{{ asset('js/main.js') }}"></script>
</body>

</html>