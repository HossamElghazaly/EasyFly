document.querySelector('form').addEventListener('submit', function (e) {
    const from = document.getElementById('from').value;
    const to = document.getElementById('to').value;
    const travelClass = document.getElementById('class').value;
    localStorage.setItem('from', from);
    localStorage.setItem('to', to);
    localStorage.setItem('class', travelClass);
});

// Retrieve on flight details page
document.addEventListener('DOMContentLoaded', function () {
    const from = localStorage.getItem('from');
    const to = localStorage.getItem('to');
    const travelClass = localStorage.getItem('class');
    document.querySelector('.route').textContent = `${from} ↔ ${to}`;
    document.querySelector('.class').textContent = `Class: ${travelClass}`;
});
