<?php

namespace App\Http\Controllers;
use App\Models\Product;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function admin() {
        $products = Product::latest()->get(); 

        return view('admin.dashboard', compact('products'));
    }

    public function manager() {
        $products = Product::latest()->get();
        return view('manager.dashboard', compact('products'));
    }
}
