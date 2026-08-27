    const logo = document.querySelector(".union");

logo.addEventListener("mousemove", (event) => {

    const rect = logo.getBoundingClientRect();

    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;

    logo.style.setProperty("--mouse-x", `${x}px`);
    logo.style.setProperty("--mouse-y", `${y}px`);
});

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visivel');
            observer.unobserve(entry.target); 
        }
    });
}, {
    threshold: 0.2 
});

document.querySelectorAll('.block').forEach(el => {
    observer.observe(el);
});