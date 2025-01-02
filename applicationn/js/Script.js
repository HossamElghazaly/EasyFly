// For Home Screen Page
document.addEventListener("DOMContentLoaded", () => {
    // Check if we are on the home screen page
    if (document.title === "EasyFly - Check-In") {
        const form = document.querySelector("form");

        // On form submission, save data to localStorage
        form.addEventListener("submit", (event) => {
            event.preventDefault(); // Prevent default form submission

            const from = document.getElementById("from").value;
            const to = document.getElementById("to").value;
            const travelClass = document.getElementById("class").value;
            const startDate = document.getElementById("start").value;
            const returnDate = document.getElementById("return").value;
            const passengers = document.getElementById("passenger").value;

            // Save the values in localStorage
            localStorage.setItem("flightDetails", JSON.stringify({
                from,
                to,
                travelClass,
                startDate,
                returnDate,
                passengers
            }));

            // Redirect to the flight details page
            window.location.href = "flight details.html";
        });
    }

    // For Flight Details Page
    if (document.title === "Flight Details") {
        const detailsContainer = document.querySelector(".details");

        // Retrieve and display flight details
        const flightDetails = JSON.parse(localStorage.getItem("flightDetails"));

        if (flightDetails) {
            // Determine price based on class
            const classPrices = {
                economy: 2000,
                "premium-economy": 3000,
                business: 5000,
                first: 8000
            };

            const price = classPrices[flightDetails.travelClass] || "Not available";

            detailsContainer.innerHTML = `
                <div class="details-header">
                    <span class="route">${flightDetails.from} ↔ ${flightDetails.to}</span>
                    <span class="price">EGP ${price}</span>
                </div>
                <p>${flightDetails.travelClass}</p>
                <p>${flightDetails.startDate} to ${flightDetails.returnDate}</p>
                <p>Passengers: ${flightDetails.passengers}</p>
                <hr>
                <p>Benefits per adult passenger:</p>
                <ul class="benefits">
                    <li><i class="fas fa-calendar-alt"></i> Flexibility to make 1 change</li>
                    <li><i class="fas fa-suitcase-rolling"></i> Checked baggage: 30kg</li>
                    <li><i class="fas fa-gift"></i> Earn dynamic points</li>
                </ul>
            `;
        }
    }
});
