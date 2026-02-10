<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    if (auth()->check()) {
        // লগইন করা থাকলে রোল অনুযায়ী ড্যাশবোর্ডে পাঠিয়ে দাও
        return match(auth()->user()->role) {
            'admin' => redirect()->route('admin.dashboard'),
            'manager' => redirect()->route('manager.dashboard'),
            default => redirect()->route('dashboard'),
        };
    }
    return view('welcome');
});

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// Admin Routes
Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/admin/dashboard', [DashboardController::class, 'admin'])->name('admin.dashboard');
});

// Manager Routes
Route::middleware(['auth', 'role:manager'])->group(function () {
    Route::get('/manager/dashboard', [DashboardController::class, 'manager'])->name('manager.dashboard');
});

// Default User Dashboard (Breeze er default tai thaklo)
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified', 'role:user'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/products', [ProductController::class, 'index'])->name('products.index');
    Route::post('/notifications/mark-as-read/{id}', [ProductController::class, 'markAsRead'])->name('notifications.markRead');
    Route::post('/notifications/mark-all-read', [ProductController::class, 'markAllRead'])->name('notifications.markAllRead');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    // শুধুমাত্র Admin এবং Manager প্রোডাক্ট Add, Update, Delete করতে পারবে
    Route::middleware(['role:manager,admin'])->group(function () {
        Route::get('/products/{id}', [ProductController::class, 'show'])->name('products.show');
        Route::post('/create-products', [ProductController::class, 'store'])->name('products.store');
        Route::put('/products/{product}', [ProductController::class, 'update'])->name('products.update');
        Route::delete('/products/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
    });
});

require __DIR__.'/auth.php';
