// Define a function to store the passenger name and randomize booking details
function handleCheckin() {
    // Retrieve user inputs from the Checkin page
    const airline = document.getElementById('airline').value;
    const bookingRef = document.getElementById('booking_ref').value;
    const emailOrLastName = document.getElementById('email_or_last_name').value;

    // Store the passenger name in localStorage to share data across pages
    localStorage.setItem('passengerName', emailOrLastName);

    // Randomize other booking details and store them in localStorage
    const randomBookingID = `BID${Math.floor(1000 + Math.random() * 9000)}`;
    const randomGate = `G${Math.floor(1 + Math.random() * 10)}`;
    const randomSeat = `${Math.floor(1 + Math.random() * 30)}${String.fromCharCode(65 + Math.floor(Math.random() * 6))}`;

    localStorage.setItem('bookingID', randomBookingID);
    localStorage.setItem('gateNumber', randomGate);
    localStorage.setItem('seatNumber', randomSeat);
}

// Add event listener to trigger the handleCheckin function on form submission
const checkinForm = document.querySelector('form');
if (checkinForm) {
    checkinForm.addEventListener('submit', (e) => {
        e.preventDefault();
        handleCheckin();
        window.location.href = 'booked.html'; // Redirect to the booked page
    });
}

// Define a function to display randomized details on the Booked page
function displayBookingDetails() {
    // Retrieve stored data from localStorage
    const passengerName = localStorage.getItem('passengerName');
    const bookingID = localStorage.getItem('bookingID');
    const gateNumber = localStorage.getItem('gateNumber');
    const seatNumber = localStorage.getItem('seatNumber');

    // Update the Booked page content
    if (document.querySelector('.flight-info')) {
        document.querySelector('.booking-details').textContent = `Booking ID: ${bookingID}`;
        document.querySelector('.flight-info .row:nth-child(4) span:first-child').textContent = passengerName;
        document.querySelector('.flight-info .row:nth-child(4) span:last-child').textContent = seatNumber;
        document.querySelector('.flight-info .row:last-child span:first-child').textContent = gateNumber;
    }
}

// Check which page is loaded and call the appropriate function
if (window.location.pathname.includes('booked.html')) {
    displayBookingDetails();
}
