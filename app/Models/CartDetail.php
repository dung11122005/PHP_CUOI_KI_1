<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartDetail extends Model
{
    use HasFactory;

    protected $fillable = ['cartdetails_checkbox', 'cartdetails_quantity', 'product_id', 'cart_id'];

      public $timestamps = true; // Thêm dòng này

      // CartDetail.php
    protected $casts = [
        'cartdetails_checkbox' => 'boolean',
    ];

    public function cart()
    {
        return $this->belongsTo(Cart::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}