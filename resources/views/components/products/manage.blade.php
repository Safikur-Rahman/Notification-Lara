<div class="overflow-x-auto">
    <table class="min-w-full bg-white border">
        <thead>
            <tr class="bg-gray-100">
                <th class="px-4 py-2 border">Name</th>
                <th class="px-4 py-2 border">Price</th>
                <th class="px-4 py-2 border">Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($products as $product)
            <tr>
                <td class="px-4 py-2 border">{{ $product->name }}</td>
                <td class="px-4 py-2 border">{{ $product->price }}</td>
                <td class="px-4 py-2 border text-center">
                    <button class="bg-yellow-500 text-black px-2 py-1 rounded">Edit</button>
                    <button class="bg-red-500 text-black px-2 py-1 rounded ml-2">Delete</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>