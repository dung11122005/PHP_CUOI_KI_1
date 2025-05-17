<?php

// app/Http/Controllers/CartController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\CartService;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    public function addProductToCart($id, Request $request)
    {
        // Kiểm tra xem người dùng đã đăng nhập chưa
        $email = $request->session()->get('email');
        if (!$email) {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            return redirect()->route('login')->with('error', 'Bạn cần đăng nhập để thêm vào giỏ hàng!');
        }
        $quantity = $request->input('quantity', 1);

        // Nếu đã đăng nhập, tiến hành thêm vào giỏ hàng
        $this->cartService->handleAddProductToCart($email, $id, $quantity );
        return response()->json([
            'status' => 'success',
            'message' => 'Thêm sản phẩm vào giỏ hàng thành công!',
        ]);
    }

    public function getCartPage(Request $request)
    {
        // Lấy ID người dùng từ session 
        $userId = $request->session()->get('user_id');

        // Lấy thông tin giỏ hàng từ Service
        $cartData = $this->cartService->getCartDetails($userId);

        // Trả về view với dữ liệu giỏ hàng
        return view('client.cart.show', $cartData);
    }

    public function postCheckOutPage(Request $request)
    {
        $cartDetails = $request->input('cartDetails', []); // Lấy danh sách giỏ hàng từ request
        $this->cartService->handleUpdateCartBeforeCheckout($cartDetails); // Gọi service để xử lý
        return redirect()->route('checkout');
    }

    public function getCheckOutPage(Request $request)
    {
        // Lấy ID người dùng từ session
        $userId = Session::get('user_id');
        if (!$userId) {
            return redirect()->route('login'); // Nếu chưa đăng nhập, chuyển đến trang đăng nhập
        }

        // Gọi service để lấy thông tin giỏ hàng
        $cartData = $this->cartService->fetchCartByUser($userId);

        // Truyền dữ liệu cho view
        return view('client.cart.checkout', [
            'cartDetails' => $cartData['cartDetails'],
            'totalPrice' => $cartData['totalPrice'],
        ]);
    }

    public function deleteProductFromCart($id, Request $request)
    {
        // Lấy thông tin người dùng từ session
        $userId = $request->session()->get('user_id');

        // Nếu không có giỏ hàng, trả về thông báo lỗi
        if (!$userId) {
            return redirect()->route('login')->with('error', 'Bạn cần đăng nhập để xóa sản phẩm.');
        }

        // Gọi service để xóa sản phẩm khỏi giỏ hàng
        return $this->cartService->handleRemoveProductFromCart($userId, $id);
    }

    public function updateQuantityAjax(Request $request)
    {
        $id = $request->input('id');
        $type = $request->input('type'); // 'increase' hoặc 'decrease'
        $userId = $request->session()->get('user_id', null);

        if (!$userId) {
            return response()->json([
                'status' => 'error',
                'message' => 'Bạn cần đăng nhập để thực hiện thao tác này.'
            ]);
        }

        // Gọi service để xử lý logic cập nhật số lượng
        $result = $this->cartService->updateCartQuantity($id, $type, $userId);

        return response()->json([
            'status' => $result['status'],
            'quantity' => $result['quantity'], // Trả về số lượng sản phẩm sau khi cập nhật
            'total' => $result['total'], // Trả về tổng tiền của sản phẩm
            'totalPrice' => $result['totalPrice'] // Trả về tổng tiền của giỏ hàng
        ]);
        
    }
}
