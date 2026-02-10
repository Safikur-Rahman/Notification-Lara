<?php

use Illuminate\Support\Facades\Broadcast;

// Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
//     return (int) $user->id === (int) $id && in_array($user->role, ['admin', 'manager']);
// });

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    // শুধুমাত্র চেক করো যে লগইন করা ইউজার নিজের চ্যানেলে লিসেন করছে কি না
    return (int) $user->id === (int) $id;
});
