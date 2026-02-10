<?php

namespace App\Observers;

use App\Models\Product;
use App\Models\User;
use App\Notifications\ProductActivityNotification;
use Illuminate\Support\Facades\Notification;

class ProductObserver
{
    /**
     * Handle the Product "created" event.
     */
    public function created(Product $product): void
    {
        $details = [
            'product_name' => $product->name,
            'action' => 'created',
            'performed_by' => auth()->user()->name ?? 'System',
        ];

        // Admin এবং Manager রোল যাদের আছে তাদের খুঁজে বের করা
        $recipients = User::whereIn('role', ['admin', 'manager'])->get();

        // নোটিফিকেশন পাঠানো (Database + Pusher)
        Notification::send($recipients, new ProductActivityNotification($details));
    }

    /**
     * Handle the Product "updated" event.
     */
    public function updated(Product $product): void
    {
        $details = [
            'product_name' => $product->name,
            'action' => 'updated',
            'performed_by' => auth()->user()->name ?? 'System',
        ];

        $recipients = User::whereIn('role', ['admin', 'manager'])->get();
        Notification::send($recipients, new ProductActivityNotification($details));
    }

    /**
     * Handle the Product "deleted" event.
     */
    public function deleted(Product $product): void
    {
        $details = [
            'product_name' => $product->name,
            'action' => 'deleted',
            'performed_by' => auth()->user()->name ?? 'System',
        ];

        $recipients = User::whereIn('role', ['admin', 'manager'])->get();
        Notification::send($recipients, new ProductActivityNotification($details));
    }
}