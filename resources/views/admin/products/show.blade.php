<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="{{ asset('css/styles.css') }}" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    @include('admin.layout.header')

    <div id="layoutSidenav">
        @include('admin.layout.sidebar')

        <div id="layoutSidenav_content">
            <div class="mt-5">
                <div class="row">
                    <div class="col-11 mx-auto">
                        <div class="d-flex justify-content-between align-items-center mb-3 pl-10">
                            <a href="/admin/product" class="text-decoration-none text-dark">
                                <h3 class="fw-bold">Table Product</h3>
                            </a>
                            <form method="GET" action="{{ route('admin.products') }}" action="" class="w-50 d-flex gap-2">
                                <input type="text" name="search" value="{{ request()->input('search') }}" class="form-control w-50 h-100"
                                    placeholder="Tìm theo tên hoặc ID sản phẩm..." />
                                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                            </form>
                            <a href="/admin/products/create" class="btn btn-primary">Create a Product</a>
                            
                        </div>
                        <hr />
                        <table class="table table-bordered table-hover">
                            <thead class="table-primary">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Factory</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                <tr>
                                    <td>{{ $product->id }}</td>
                                    <td class="text-truncate" style="max-width: 150px;">{{ $product->product_name }}</td>
                                    <td>{{ number_format($product->product_price, 0, ',', '.') }} ₫</td>
                                    <td>{{ $product->product_factory }}</td>
                                    <td>{{ $product->product_type }}</td>
                                    <td>
                                        <div class="d-flex align-items-center gap-1">
                                            <a href="{{ url('/admin/product/' . $product->id) }}"
                                                class="btn btn-success btn-sm">View</a>
                                            <a href="{{ url('/admin/product/update/' . $product->id) }}"
                                                class="btn btn-warning btn-sm">Update</a>
                                            <form action="{{ url('/admin/product/delete/' . $product->id) }}" method="POST"
                                                class="d-inline"
                                                onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>

                        <div class="d-flex justify-content-center">
                            {{ $products->appends(['search' => request()->input('search')])->links('pagination::bootstrap-4') }}
                        </div>
                    </div>
                </div>
            </div>
            @extends('admin.layout.footer')
        </div>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="{{ asset('js/scripts.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
    <script src="{{ asset('js/chart-area-demo.js') }}"></script>
    <script src="{{ asset('js/chart-bar-demo.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="{{ asset('js/datatables-simple-demo.js') }}"></script>
</body>

</html>
