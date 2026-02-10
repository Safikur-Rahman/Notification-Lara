<?php
namespace App\Http\Controllers;

use App\Notifications\ProductActivityNotification;
use Illuminate\Support\Facades\Notification;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;

class ProductController extends Controller
{
   
    public function index()
    {
        $products = Product::latest()->get();
        return view('components.products.index', compact('products')); 
    }

   
    public function show($id)
    {
        $product = Product::findOrFail($id);
        return view('components.products.show', compact('product'));
    }

   public function store(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'price' => 'required|numeric',
    ]);

    
    $product = Product::create([
        'name' => $request->name,
        'price' => $request->price,
        'user_id' => auth()->id(), 
    ]);

    // Debug log for product
    \Log::debug("New Product Created", [
        'id' => $product->id,
        'name' => $product->name,
        'price' => $product->price,
        'user_id' => $product->user_id,
    ]);

    
    $details = [
        'product_id'   => (string) $product->id,
        'product_name' => $product->name,
        'action'       => 'created',
        'performed_by' => auth()->user()->name,
    ];

    // Debug log for notification details
    \Log::debug("Notificationnnn Details", $details); 

   
    $usersToNotify = User::whereIn('role', ['admin', 'manager'])->distinct()->get();

    foreach ($usersToNotify as $user) {
        if ($user->id !== auth()->id()) { 
            $exists = $user->unreadNotifications()
                           ->where('data->product_id', $product->id)
                           ->exists();

            if (!$exists) {
                try {
                    $user->notify(new ProductActivityNotification($details));
                    // Debug log for notification sent
                    \Log::debug("Notification sent to user", ['user_id' => $user->id, 'product_id' => $product->id]);
                } catch (\Exception $e) {
                    \Log::error("Notification failed: " . $e->getMessage());
                }
            } else {
                \Log::debug("Notification already exists for user", ['user_id' => $user->id, 'product_id' => $product->id]);
            }
        }
    }

    return redirect()->back()->with('success', 'প্রোডাক্টটি সফলভাবে যোগ করা হয়েছে!');
}


    public function markAsRead($id)
{
    
    $notification = auth()->user()->notifications()->where('id', $id)->first();
    
    if ($notification) {
       
        if ($notification->unread()) {
            $notification->markAsRead();
        }
        return response()->json(['success' => true]);
    }
    
    return response()->json(['success' => false, 'message' => 'Notification not found'], 404);
}

    public function markAllRead()
    {
        auth()->user()->unreadNotifications->markAsRead();
        return response()->json(['success' => true]);
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric',
        ]);
        $product->update($request->all());
        return back()->with('success', 'Product updated successfully!');
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return back()->with('success', 'Product deleted successfully!');
    }
}