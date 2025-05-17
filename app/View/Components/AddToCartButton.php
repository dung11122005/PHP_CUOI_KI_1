<?php

namespace App\View\Components;

use Illuminate\View\Component;

class AddToCartButton extends Component
{
    public $productId;
    public $quantity;
    public $buttonClass;

    public function __construct($productId, $quantity = 1, $buttonClass = null)
    {
        $this->productId = $productId;
        $this->quantity = $quantity;
        $this->buttonClass = $buttonClass;
    }

    public function render()
    {
        return view('components.add-to-cart-button');
    }
}
