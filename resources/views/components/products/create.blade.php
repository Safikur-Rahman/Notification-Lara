<div class="p-6 bg-white border-b border-gray-200">
    @if(session('success'))
        <div class="mb-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded">
            {{ session('success') }}
        </div>
    @endif

    @if($errors->any())
        <div class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('products.store') }}" method="POST">
        @csrf
        <div class="mb-4">
            <label class="block text-sm font-bold mb-2">Product Name</label>
            <input type="text" name="name" class="w-full border rounded px-3 py-2" placeholder="Enter product name" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-bold mb-2">Price</label>
            <input type="number" name="price" class="w-full border rounded px-3 py-2" placeholder="0.00" required>
        </div>
        <button type="submit" class="bg-blue-600 text-black px-4 py-2 rounded hover:bg-blue-700">
            Save Product
        </button>
    </form>
</div>