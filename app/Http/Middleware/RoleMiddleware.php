<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, ...$roles): Response
{
    
    if (!auth()->check()) {
        return redirect()->route('login');
    }

    
    if (in_array(auth()->user()->role, $roles)) {
        return $next($request);
    }

    
    $userRole = auth()->user()->role;
    
    return match($userRole) {
        'admin' => redirect()->route('admin.dashboard')->with('error', 'Unauthorized access.'),
        'manager' => redirect()->route('manager.dashboard')->with('error', 'Unauthorized access.'),
        'user' => redirect()->route('dashboard'),
        default => abort(403, 'আপনার এই পেজে প্রবেশের অনুমতি নেই।'),
    };
}
}
