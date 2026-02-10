<x-app-layout>
    <!-- Pusher & Laravel Echo -->
    <script src="https://js.pusher.com/8.2.0/pusher.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/laravel-echo@1.15.3/dist/echo.iife.js"></script>

    <script>
        // -----------------------------
        // 1. Single notification read
        // -----------------------------
         function markSingleAsRead(notifId, productId) {
        console.group("Mark Single As Read");
        console.log("Notification ID:", notifId);
        console.log("Product ID:", productId);

        fetch(`/notifications/mark-as-read/${notifId}`, {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
            }
        })
        .then(res => res.json())
        .then(data => {
            console.log("Response:", data);
            if (data.success) {
                //  Redirect only if productId exists
                if (productId !== null && productId !== "null") {
                    console.log("Redirecting to product page...");
                    window.location.href = `/products/${productId}`;
                } else {
                    console.log("No product ID: staying on page");
                }
            }
        })
        .catch(err => console.error("Error marking as read:", err));

        console.groupEnd();
    }


        // -----------------------------
        // 2. Dropdown toggle
        // -----------------------------
        function toggleNotifications(event) {
            event.preventDefault();
            event.stopPropagation();
            const list = document.getElementById('notification-list');
            const isHidden = list.classList.contains('hidden') || list.style.display === "none";
            list.style.display = isHidden ? "block" : "none";
            list.classList.toggle('hidden', !isHidden);
        }

        // -----------------------------
        // 3. Mark all as read
        // -----------------------------
        function markAllAsRead(event) {
            event.preventDefault();
            event.stopPropagation();
            fetch('{{ route("notifications.markAllRead") }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json'
                }
            })
            .then(res => res.json())
            .then(data => { if (data.success) location.reload(); })
            .catch(err => console.error("Error marking all as read:", err));
        }

        // -----------------------------
        // 4. Attach click listeners to Blade notifications
        // -----------------------------
        document.addEventListener("DOMContentLoaded", function() {
    const itemsContainer = document.getElementById('notifications-items');
    if (!itemsContainer) return;

    const notifications = itemsContainer.querySelectorAll('[data-notif-id]');
    notifications.forEach(div => {
        div.addEventListener('click', function() {
            const nId = div.getAttribute('data-notif-id');
            const pId = div.getAttribute('data-product-id') || null;
            markSingleAsRead(nId, pId);
        });
    });
});


        // -----------------------------
        // 5. Real-time notifications (Pusher / Echo)
        // -----------------------------
        setTimeout(() => {
        if (!window.Echo) return;

        window.Echo.private(`App.Models.User.${window.Laravel.userId}`)
            .notification((notification) => {
                console.group("Real-time Notification Debug");
                console.log("Raw notification:", notification);

                const nId = notification.id;
                const pId = notification.data?.product_id ?? null;
                const userName = notification.data?.user_name ?? 'System';
                const messageBody = notification.data?.message ?? "New activity";

                console.log("Extracted Product ID:", pId); 

                const countBadge = document.getElementById('notification-count');
                const itemsContainer = document.getElementById('notifications-items');

                // Update badge
                let currentCount = parseInt(countBadge.innerText) || 0;
                countBadge.innerText = currentCount + 1;
                countBadge.classList.remove('hidden');

                // Remove placeholder if exists
                if (itemsContainer.innerHTML.includes('No new notifications')) {
                    itemsContainer.innerHTML = '';
                }

                // Create notification div
                const div = document.createElement('div');
                div.id = `notification-${nId}`;
                div.dataset.notifId = nId;
                div.dataset.productId = pId; // This will contain the product_id
                div.className = "px-4 py-3 border-b border-gray-100 cursor-pointer bg-blue-50 hover:bg-blue-100 transition";

                div.innerHTML = `
                    <p class="text-sm text-gray-900 font-bold">
                        <strong class="text-blue-600">${userName}</strong> ${messageBody}
                    </p>
                    <span class="text-[10px] text-gray-400 italic">Just now</span>
                `;

                console.log("Notification HTML created with Product ID:", pId); // Debug the product_id before appending

                // Attach click listener
                div.addEventListener('click', function() {
                    markSingleAsRead(nId, pId);
                });

                itemsContainer.prepend(div);
                console.groupEnd();
            });

    }, 1000);
    </script>

    <!-- Header / Notifications Dropdown -->
    <x-slot name="header">
        <div class="flex justify-between items-center">
            <nav class="flex gap-6 items-center">
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">Admin Dashboard</h2>
                <a href="{{ route('dashboard') }}" class="text-blue-600 hover:text-blue-800 font-medium">Dashboard</a>
            </nav>

            <div class="relative inline-block text-left">
                <button onclick="toggleNotifications(event)" class="relative p-2 text-gray-500 hover:text-gray-700 focus:outline-none">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
                    </svg>
                    <span id="notification-count" class="absolute top-0 right-0 inline-flex items-center justify-center px-1.5 py-0.5 text-[10px] font-bold text-white bg-red-600 rounded-full {{ auth()->user()->unreadNotifications->count() > 0 ? '' : 'hidden' }}">
                        {{ auth()->user()->unreadNotifications->count() }}
                    </span>
                </button>

                <div id="notification-list" class="absolute right-0 mt-2 w-80 bg-white border border-gray-200 rounded-lg shadow-xl z-50 hidden">
                    <div class="py-2 border-b px-4 flex justify-between items-center bg-gray-50">
                        <span class="font-bold text-xs uppercase text-gray-700">Notifications</span>
                        <button onclick="markAllAsRead(event)" class="text-[10px] bg-blue-100 text-blue-700 px-2 py-1 rounded font-bold uppercase">Mark all read</button>
                    </div>
                    <div id="notifications-items" class="max-h-64 overflow-y-auto">
                        @forelse(auth()->user()->notifications->take(30) as $notification)
                            @php $pId = $notification->data['product_id'] ?? null; @endphp
                            <div id="notification-{{ $notification->id }}"
                                 data-notif-id="{{ $notification->id }}"
                                 data-product-id="{{ $pId }}"
                                 class="px-4 py-3 border-b border-gray-100 cursor-pointer transition {{ $notification->read_at ? 'bg-white' : 'bg-blue-50 hover:bg-blue-100' }}">
                                <p class="text-sm {{ $notification->read_at ? 'text-gray-500' : 'text-gray-900 font-bold' }}">
                                    <strong class="text-blue-600">{{ $notification->data['user_name'] ?? 'System' }}</strong> 
                                    {{ $notification->data['message'] ?? 'Product activity' }}
                                </p>
                                <span class="text-[10px] text-gray-400 italic">{{ $notification->created_at->diffForHumans() }}</span>
                            </div>
                        @empty
                            <p class="p-6 text-sm text-gray-400 text-center italic">No new notifications</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </x-slot>



    <div class="p-6">
        @if(session('success'))
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 px-4 py-3 rounded mb-4 shadow-sm">
                {{ session('success') }}
            </div>
        @endif

        <div class="mb-8 bg-white p-6 rounded-lg shadow-sm border border-gray-100">
            <h3 class="text-lg font-bold mb-4 text-gray-700">Add New Product</h3>
            @include('components.products.create')
        </div>

        <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
            <h3 class="text-lg font-bold mb-4 text-gray-700">Manage Products</h3>
            @include('components.products.manage', ['products' => $products])
        </div>
    </div>
</x-app-layout>
