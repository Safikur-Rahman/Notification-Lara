<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Product Details
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                <div class="mb-4">
                    <h1 class="text-2xl font-bold">{{ $product->name }}</h1>
                    <p class="text-gray-600 italic">Added by: {{ $product->user->name ?? 'Unknown' }}</p>
                </div>
                <div class="border-t pt-4">
                    <p class="text-lg"><strong>Price:</strong> ${{ number_format($product->price, 2) }}</p>
                    <p class="text-sm text-gray-400 mt-2">Added at: {{ $product->created_at->format('d M Y, h:i A') }}</p>
                </div>
                <div class="mt-6">
                    <a href="{{ url()->previous() }}" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Back</a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>