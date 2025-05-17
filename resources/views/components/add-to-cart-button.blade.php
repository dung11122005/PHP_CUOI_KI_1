<form class="add-to-cart-form" id="addToCartForm">
    @csrf
    <input type="hidden" name="product_id" value="{{ $productId }}">
    <input type="hidden" name="quantity" value="{{ $quantity ?? 1 }}">
    <button type="button"
        class="{{ $buttonClass ?? 'btnAddToCartHomepage btn btn-primary border-0 rounded-pill px-4 py-2 text-white w-100' }}">
        <i class="fa fa-shopping-bag me-2"></i> Add to cart
    </button>
</form>
