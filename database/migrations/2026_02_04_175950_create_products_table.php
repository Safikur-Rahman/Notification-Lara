<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::create('products', function (Blueprint $table) {
        $table->id(); // id
        $table->string('name'); // name
        $table->decimal('price', 10, 2); // price
        // আপনি চাইলে কে প্রোডাক্ট অ্যাড করেছে তার জন্য ইউজার আইডি রাখতে পারেন
        $table->foreignId('user_id')->nullable()->constrained()->onDelete('cascade'); 
        $table->timestamps(); // created_at এবং updated_at
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
