// Go to Registration Page
document.getElementById("createAccountLink")?.addEventListener("click", function (e) {
    e.preventDefault();
    window.location.href = "{{url_for('auth.sign_up')}}"; // Redirects to the registration page
});

// Go to Login Page
document.getElementById("signInLink")?.addEventListener("click", function (e) {
    e.preventDefault();
    window.location.href = "{{url_for('auth.login')}}"; // Redirects to the login page
});
