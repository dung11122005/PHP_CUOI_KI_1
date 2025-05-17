<?php
// app/Services/CartService.php
namespace App\Services;

use App\Models\User;
use App\Models\Cart;
use App\Models\CartDetail;
use App\Models\Product;
use Illuminate\Support\Facades\Session;

class CartService
{

    public function handleAddProductToCart($email, $productId, $quantity = 1)
    {
        // Lấy thông tin người dùng theo email
        $user = User::where('user_email', $email)->first();
        if ($user) {
            // Kiểm tra giỏ hàng có tồn tại không
            $cart = Cart::where('user_id', $user->id)->first();

            if (!$cart) {
                // Tạo mới giỏ hàng
                $cart = Cart::create([
                    'user_id' => $user->id,
                    'cart_sum' => 0,
                ]);
            }

            // Tìm sản phẩm theo ID
            $product = Product::find($productId);
            if ($product) {
                // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
                $cartDetail = CartDetail::where('cart_id', $cart->id)
                    ->where('product_id', $productId)
                    ->first();

                if (!$cartDetail) {
                    // Tạo mới chi tiết giỏ hàng
                    CartDetail::create([
                        'cart_id' => $cart->id,
                        'product_id' => $product->id,
                        'cartdetails_quantity' => $quantity,
                        'cartdetails_checkbox' => false,
                    ]);
                    // Cập nhật tổng số lượng trong giỏ hàng
                    $cart->cart_sum += $quantity;
                    $cart->save();
                } else {
                    // Cập nhật số lượng nếu sản phẩm đã có
                    $cartDetail->cartdetails_quantity+= $quantity;
                    $cartDetail->save();
                }

                // Cập nhật session giỏ hàng
                Session::put('cart_sum', $cart->cart_sum);
            }
        }
    }

    public function getCartDetails($userId)
    {
        // Tìm giỏ hàng của người dùng
        $cart = Cart::where('user_id', $userId)->first();

        // Nếu không có giỏ hàng, trả về danh sách rỗng
        if (!$cart) {
            return [
                'cartDetails' => [],
                'totalPrice' => 0,
                'cart' => null
            ];
        }

        // Lấy danh sách chi tiết giỏ hàng
        $cartDetails = $cart->cartDetails;
        $totalPrice = 0;

        foreach ($cartDetails as $cd) {
            // Đặt checkbox về false
            $cd->cartdetails_checkbox = false;
            $cd->save();

            // Tính tổng tiền
            $totalPrice += $cd->product->product_price * $cd->cartdetails_quantity;
        }

        return [
            'cartDetails' => $cartDetails,
            'totalPrice' => $totalPrice,
            'cart' => $cart
        ];
    }

    public function handleRemoveProductFromCart($userId, $cartDetailId)
    {
        // Tìm giỏ hàng của người dùng
        $cart = Cart::where('user_id', $userId)->first();
    
        if (!$cart) {
            // Trả về lỗi nếu giỏ hàng không tồn tại
            return response()->json([
                'status' => 'error',
                'message' => 'Giỏ hàng không tồn tại.'
            ], 404);  // Trả về mã lỗi 404 (Not Found)
        }
    
        // Tìm chi tiết sản phẩm cần xóa trong giỏ hàng
        $cartDetail = $cart->cartDetails()->where('id', $cartDetailId)->first();
    
        if (!$cartDetail) {
            // Trả về lỗi nếu sản phẩm không có trong giỏ hàng
            return response()->json([
                'status' => 'error',
                'message' => 'Sản phẩm không có trong giỏ hàng.'
            ], 404);  // Trả về mã lỗi 404 (Not Found)
        }
    
        // Xóa sản phẩm khỏi giỏ hàng
        $cartDetail->delete();
    
        // Trả về thông báo thành công
        return response()->json([
            'status' => 'success',
            'message' => 'Xóa sản phẩm thành công.',
        ]);
    }
    
    public function handleUpdateCartBeforeCheckout(array $cartDetails)
    {
        foreach ($cartDetails as $cartDetail) {
            $currentCartDetail = CartDetail::find($cartDetail['id']);


            if ($currentCartDetail) {
                // Sử dụng setAttribute để gán giá trị cho đúng tên cột
                $currentCartDetail->setAttribute('cartDetails_quantity', $cartDetail['quantity']);
                $currentCartDetail->setAttribute('cartDetails_checkbox', $cartDetail['checkbox'] ?? 0); // Mặc định là 0 nếu không được check

                $currentCartDetail->save();
            }

        }
    }

    public function fetchCartByUser($userId)
    {
        $cart = Cart::where('user_id', $userId)->with('cartDetails')->first();

        if (!$cart) {
            return [
                'cartDetails' => [],
                'totalPrice' => 0
            ];
        }

        $cartDetails = $cart->cartDetails->filter(function ($cd) {
            return $cd->cartdetails_checkbox != 0;
        });

        $totalPrice = $cartDetails->sum(function ($cd) {
            return $cd->product->product_price * $cd->cartdetails_quantity;
        });

        return [
            'cartDetails' => $cartDetails,
            'totalPrice' => $totalPrice
        ];
    }

    public function updateCartQuantity( $cartDetailID, $type, $userId)
    {
       // Tìm kiếm sản phẩm trong giỏ hàng của người dùng
        $cartDetail = CartDetail::where('id', $cartDetailID)->first();

        if ($cartDetail) {
            // Cập nhật số lượng sản phẩm trong giỏ hàng
            if ($type == 'increase') {
                $cartDetail->cartDetails_quantity += 1;
            } elseif ($type == 'decrease' && $cartDetail->cartDetails_quantity > 1) {
                $cartDetail->cartDetails_quantity -= 1;
            }
            $cartDetail->save();
        }
        // Tính toán tổng tiền của sản phẩm (không cần lưu vào cơ sở dữ liệu)
        $total = $cartDetail->cartDetails_quantity * $cartDetail->product->product_price;

        // Cập nhật tổng giá tiền
        $cartData = $this->getCartDetails($userId);
        $totalPrice = $cartData['totalPrice'];
        return [
            'status' => 'success',
            'quantity' => $cartDetail->cartDetails_quantity,
            'total' => number_format($total, 0, ',', '.'),
            'totalPrice' => number_format($totalPrice, 0, ',', '.')
        ];
       
    }
}
