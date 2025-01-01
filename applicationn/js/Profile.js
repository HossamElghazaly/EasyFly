// Profile.js

// Function to store the username in localStorage from sign-up page
function saveUserName() {
    const userNameField = document.getElementById("user-name");
    if (userNameField) {
        const userName = userNameField.value;
        localStorage.setItem("userName", userName);
    }
}

// Function to display the username on the profile page
function displayUserName() {
    const userName = localStorage.getItem("userName");
    if (userName) {
        const profileNameField = document.querySelector(".profile-avatar span");
        const profileTextField = document.querySelector(".text-lg.font-semibold.mb-2");

        if (profileNameField) {
            profileNameField.textContent = userName.charAt(0).toUpperCase(); // Show first letter of username
        }

        if (profileTextField) {
            profileTextField.textContent = userName; // Show full username
        }
    }
}

// Attach saveUserName function to the submit button on the sign-up page
document.addEventListener("DOMContentLoaded", function () {
    const signUpForm = document.querySelector("form");
    if (signUpForm) {
        signUpForm.addEventListener("submit", saveUserName);
    }

    // Display username on the profile page
    displayUserName();
});
