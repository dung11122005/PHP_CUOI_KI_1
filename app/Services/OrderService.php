<?php
namespace App\Services;

use App\Models\Cart;
use App\Models\CartDetail;
use App\Models\Order;
use App\Models\OrderDetail;

class OrderService
{


    public function getAllOrder($perPage = 10)
    {
        return Order::paginate($perPage);
    }

    public function searchOrders($searchTerm, $perPage = 10)
    {
        return Order::where('receiver_name', 'like', '%' . $searchTerm . '%')
            ->orWhere('receiver_address', 'like', '%' . $searchTerm . '%')
            ->orWhere('receiver_phone', 'like', '%' . $searchTerm . '%')
            ->orWhere('id', 'like', '%' . $searchTerm . '%')
            ->paginate($perPage);
    }

    // Phương thức để lấy tổng số đơn hàng
    public function getAllOrderCount()
    {
        return Order::count();
    }

    // Lấy số lượng đơn hàng với trạng thái 'completed' cho từng tháng trong năm
    public function getOrderCountByYear($year)
    {
        $orderCounts = [];
        
        for ($month = 1; $month <= 12; $month++) {
            $orderCounts[$month] = Order::whereYear('created_at', $year)
                ->whereMonth('created_at', $month)
                ->where('order_status', 'complete')
                ->count();
        }

        return $orderCounts;
    }

    //Thống kê doanh thu theo tháng trong năm
    public function getRevenueByYear($year)
    {
        $revenues = array_fill(1, 12, 0);

        for ($month = 1; $month <= 12; $month++) {
            $revenues[$month] = Order::whereYear('created_at', $year)
                ->whereMonth('created_at', $month)
                ->where('order_status', 'complete')
                ->sum('total_price');
        }

        return $revenues;
    }

    public function getOrderById($id)
    {
         return Order::with('orderDetails')->find($id);

    }

    public function getOrdersByUserId($userId)
    {
        return Order::with('orderDetails')
                    ->where('user_id', $userId)
                    ->get();
    }

    public function handleUpdateOrder($status ,$id)
    {
        $order= Order::with('orderDetails')->find($id);

        $order->order_status=$status;
        $order->save();

    }

    // Lấy thông tin giỏ hàng
    public function getCartDetails($userId)
    {
        $cart = Cart::where('user_id', $userId)->with('cartDetails.product')->first();

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

    // Tạo đơn hàng
    public function placeOrder($userId, $data, $cartDetails)
{
    // Tạo đơn hàng
    $order = Order::create([
        'user_id' => $userId,
        'receiver_name' => $data['receiverName'],
        'receiver_address' => $data['receiverAddress'],
        'receiver_phone' => $data['receiverPhone'],
        'total_price' => $data['totalPrice'],
        'order_status' => 'pending',
        'payment_method' => $data['paymentMethod'],
        'pay' => 0, // Đơn hàng chưa thanh toán
    ]);

    // Lưu chi tiết đơn hàng
    foreach ($cartDetails as $cartDetail) {
        if ($cartDetail->cartdetails_checkbox == 1) {
            OrderDetail::create([
                'order_id' => $order->id,
                'product_id' => $cartDetail->product_id,
                'quantity' => $cartDetail->cartdetails_quantity,
                'price' => $cartDetail->product->product_price,
                'payment_method' => $data['paymentMethod'],
            ]);
        }
    }

    // Xóa các CartDetail đã được checkout
    $cartIds = Cart::where('user_id', $userId)->pluck('id');
    foreach ($cartIds as $cartId) {
        // Xóa các CartDetail có checkbox = 1
        CartDetail::where('cart_id', $cartId)
            ->where('cartdetails_checkbox', 1)
            ->delete();

        // Tính lại tổng số lượng loại sản phẩm còn lại trong giỏ hàng
        $newCartSum = CartDetail::where('cart_id', $cartId)->count();

        // Cập nhật cart_sum hoặc xóa cart nếu không còn chi tiết
        if ($newCartSum > 0) {
            Cart::where('id', $cartId)->update(['cart_sum' => $newCartSum]);
        } else {
            Cart::where('id', $cartId)->delete();
        }
    }

    

    return $order;
}

}