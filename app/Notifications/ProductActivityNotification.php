<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Notification;

class ProductActivityNotification extends Notification implements ShouldBroadcast
{
    use Queueable;

    public $details;

    public function __construct($details)
    {
        $this->details = $details;
    }

    public function via($notifiable): array
    {
        return ['database', 'broadcast'];
    }

    /**
     * ডাটাবেজের জন্য (toArray)
     */
    public function toArray($notifiable): array
    {
        return [
            'product_id'   => $this->details['product_id'] ?? null,
            'user_name'    => $this->details['performed_by'] ?? 'System',
            'message'      => "created a new product: " . ($this->details['product_name'] ?? 'Unknown'),
        ];
    }

    /**
     * ব্রডকাস্ট বা পুশারের জন্য (toBroadcast)
     */
    public function toBroadcast($notifiable): BroadcastMessage
{
    // Debug log for notification details
    \Log::debug('Notification details:', [
        'product_id' => $this->details['product_id'] ?? 'null',  // Checking product_id
        'user_name' => $this->details['performed_by'],
        // 'message' => $this->details['message'],
    ]);

    return new BroadcastMessage([
        'id' => $this->id,
        'data' => [    // data wrapper essential
            'product_id'   => $this->details['product_id'] ?? null,
            'product_name' => $this->details['product_name'] ?? 'Unknown',
            'user_name'    => $this->details['performed_by'] ?? 'System',
            'message'      => "created a new product: " . ($this->details['product_name'] ?? 'Unknown'),
        ],
    ]);
}





}