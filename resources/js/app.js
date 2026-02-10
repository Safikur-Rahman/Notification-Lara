import './bootstrap';
import Alpine from 'alpinejs';

window.Alpine = Alpine;
Alpine.start();

// রিয়েল-টাইম নোটিফিকেশন লিসেনার
// নিশ্চিত করুন যে layouts/app.blade.php এর head এ window.Laravel.userId সেট করা আছে
const userId = window.Laravel ? window.Laravel.userId : null;

if (userId) {
    window.Echo.private(`App.Models.User.${userId}`)
        .notification((notification) => {
            console.log('New Notification:', notification.message);
            
            // ১. একটি অ্যালার্ট দেখানো (টেস্ট করার জন্য)
            alert(notification.message);

            // ২. নোটিফিকেশন বেল আইকনের কাউন্ট আপডেট করা
            const badge = document.getElementById('notification-count');
            if (badge) {
                let currentCount = parseInt(badge.innerText) || 0;
                badge.innerText = currentCount + 1;
                badge.classList.remove('hidden'); // যদি লুকানো থাকে তবে দেখাবে
            }
        });
}