<x-app-layout>
    <script src="https://js.pusher.com/8.2.0/pusher.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/laravel-echo@1.15.3/dist/echo.iife.js"></script>

    <script>
        
        function markSingleAsRead(id) {
            const el = document.getElementById(`notification-${id}`);
            if (!el || el.classList.contains('bg-white')) return;

            fetch(`/notifications/mark-as-read/${id}`, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    el.classList.remove('bg-blue-50');
                    el.classList.add('bg-white');
                    const p = el.querySelector('p');
                    if(p) p.classList.replace('font-bold', 'text-gray-500');

                    // কাউন্ট ১ কমানো
                    const badge = document.getElementById('notification-count');
                    let count = parseInt(badge.innerText) || 0;
                    if (count > 0) {
                        badge.innerText = count - 1;
                        if (count - 1 === 0) badge.classList.add('hidden');
                    }
                }
            });
        }

       
        function markAllAsRead(event) {
            event.preventDefault();
            event.stopPropagation();
            fetch('{{ route("notifications.markAllRead") }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    const items = document.querySelectorAll('#notifications-items > div');
                    items.forEach(item => {
                        item.classList.remove('bg-blue-50');
                        item.classList.add('bg-white');
                        const p = item.querySelector('p');
                        if(p) {
                            p.classList.remove('text-gray-900', 'font-bold');
                            p.classList.add('text-gray-500');
                        }
                    });
                    const badge = document.getElementById('notification-count');
                    badge.innerText = '0';
                    badge.classList.add('hidden');
                }
            });
        }

        // ৩. ড্রপডাউন টগল ফাংশন
        window.toggleNotifications = function(event) {
            event.preventDefault();
            event.stopPropagation();
            const list = document.getElementById('notification-list');
            const isHidden = (list.style.display === "none" || list.classList.contains('hidden'));
            list.style.display = isHidden ? "block" : "none";
            list.classList.toggle('hidden', !isHidden);
        };

        // ৪. রিয়েল-টাইম ইকো লিসেনার
        setTimeout(() => {
            if (window.Echo) {
                window.Echo.private(`App.Models.User.{{ auth()->id() }}`)
                    .notification((notification) => {
                        const countBadge = document.getElementById('notification-count');
                        const itemsContainer = document.getElementById('notifications-items');
                        
                        const nId = notification.id;
                        const userName = notification.user_name || 'System';
                        const messageBody = notification.message || "New product activity recorded";

                        let currentCount = parseInt(countBadge.innerText) || 0;
                        countBadge.innerText = currentCount + 1;
                        countBadge.classList.remove('hidden');

                        if (itemsContainer.innerHTML.includes('No new notifications')) itemsContainer.innerHTML = '';

                        const itemHtml = `
                            <div id="notification-${nId}" onclick="markSingleAsRead('${nId}')" 
                                 class="px-4 py-3 border-b border-gray-100 cursor-pointer bg-blue-50 hover:bg-blue-100 transition duration-150">
                                <p class="text-sm text-gray-900 font-bold">
                                    <strong class="text-blue-600">${userName}</strong> ${messageBody}
                                </p>
                                <span class="text-[10px] text-gray-400 italic">Just now</span>
                            </div>
                        `;
                        itemsContainer.insertAdjacentHTML('afterbegin', itemHtml);
                    });
            }
        }, 1000);
    </script>

    <x-slot name="header">
        <div class="flex justify-between items-center">
            <nav class="flex gap-6 items-center">
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                    {{ __('Manager Dashboard') }}
                </h2>
                <div class="flex gap-4">
                    <a href="{{ route('dashboard') }}" class="text-blue-600 hover:text-blue-800 font-medium">Dashboard</a>
                </div>
            </nav>

            <div class="relative inline-block text-left">
                <button id="notification-btn" onclick="toggleNotifications(event)" type="button" class="relative p-2 text-gray-500 hover:text-gray-700 focus:outline-none">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
                    </svg>
                    <span id="notification-count" class="absolute top-0 right-0 inline-flex items-center justify-center px-1.5 py-0.5 text-[10px] font-bold leading-none text-white bg-red-600 rounded-full {{ auth()->user()->unreadNotifications->count() > 0 ? '' : 'hidden' }}">
                        {{ auth()->user()->unreadNotifications->count() }}
                    </span>
                </button>

                <div id="notification-list" style="display: none;" class="absolute right-0 mt-2 w-80 bg-white border border-gray-200 rounded-lg shadow-xl overflow-hidden z-50">
                    <div class="py-2 border-b border-gray-100 px-4 flex justify-between items-center bg-gray-50">
                        <span class="font-bold text-xs text-gray-700 uppercase">Notifications</span>
                        <button onclick="markAllAsRead(event)" class="text-[10px] bg-blue-100 text-blue-700 px-2 py-1 rounded hover:bg-blue-200 transition font-bold uppercase">
                            Mark all read
                        </button>
                    </div>
                    <div id="notifications-items" class="max-h-64 overflow-y-auto">
                        @forelse(auth()->user()->notifications->take(30) as $notification)
                            <div id="notification-{{ $notification->id }}" 
                                 onclick="markSingleAsRead('{{ $notification->id }}')"
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