<?php

namespace App\Http\Controllers;

use App\Services\UserService;
use App\Services\ProductService;
use App\Services\OrderService;
use Illuminate\Http\Request;
class DashboardController
{
    private $userService;
    private $productService;
    private $orderService;

    public function __construct(UserService $userService, ProductService $productService, OrderService $orderService)
    {
        $this->userService = $userService;
        $this->productService = $productService; 
        $this->orderService = $orderService;
    }

    public function viewDashboard(){

        // Check if the user is authenticated and has the role of admin (role_id = 1
        if (!auth()->check() || auth()->user()->role_id != 1) {
            return redirect('/')->with('error', 'You do not have permission to access this page.');
        }
        //Get data for the dashboard
        $userCount = $this->userService->getAllUserCount();
        $productCount = $this->productService->getAllProductCount();
        $orderCount = $this->orderService->getAllOrderCount();

        $orderCountByYear = $this->orderService->getOrderCountByYear(date('2025'));
        $revenueByYear = $this->orderService->getRevenueByYear(date('2025'));

        return view("admin.dashboard.show",
            [
                'userCount' => $userCount,
                'productCount' => $productCount,
                'orderCount' => $orderCount,
                'orderCountByYear' => $orderCountByYear,
                'revenueByYear' => $revenueByYear,
            ]
        );
    }
}