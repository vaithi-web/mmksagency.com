document.addEventListener('DOMContentLoaded', function () {
  const navbar = document.querySelector('.navbar');
  const backToTop = document.querySelector('.back-to-top');
  const mobileToggle = document.querySelector('.navbar-toggler');
  const loading = document.querySelector('.loading-screen');

  // Set active navbar link based on current page
  const currentPage = window.location.pathname.split('/').pop() || 'index.html';
  const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
  
  navLinks.forEach(link => {
    const href = link.getAttribute('href');
    // Remove active class from all links
    link.classList.remove('active');
    
    // Check if this link matches current page
    if ((currentPage === '' || currentPage === 'index.html') && (href === 'index.html' || href === './index.html')) {
      link.classList.add('active');
    } else if (currentPage === href || currentPage === './' + href) {
      link.classList.add('active');
    } else if (href.includes(currentPage) && currentPage.includes('services/')) {
      // For service pages, highlight Services dropdown
      if (link.classList.contains('dropdown-toggle')) {
        link.classList.add('active');
      }
    }
  });

  window.addEventListener('scroll', function () {
    if (window.scrollY > 20) {
      navbar.classList.add('scrolled');
      backToTop.style.display = 'flex';
    } else {
      navbar.classList.remove('scrolled');
      backToTop.style.display = 'none';
    }
  });

  backToTop.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));

  if (loading) {
    setTimeout(() => {
      loading.classList.add('fade-out');
      setTimeout(() => loading.remove(), 500);
    }, 900);
  }

  const filterButtons = document.querySelectorAll('.portfolio-filter button');
  const portfolioItems = document.querySelectorAll('.portfolio-item');

  filterButtons.forEach((button) => {
    button.addEventListener('click', () => {
      filterButtons.forEach((btn) => btn.classList.remove('btn-primary'));
      filterButtons.forEach((btn) => btn.classList.add('btn-outline-light'));
      button.classList.add('btn-primary');
      button.classList.remove('btn-outline-light');
      const filter = button.dataset.filter;
      portfolioItems.forEach((item) => {
        if (filter === 'all' || item.dataset.category === filter) {
          item.style.display = 'block';
        } else {
          item.style.display = 'none';
        }
      });
    });
  });

  const counters = document.querySelectorAll('[data-count]');
  const countObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseInt(el.dataset.count, 10);
        let current = 0;
        const step = Math.max(1, Math.floor(target / 80));
        const interval = setInterval(() => {
          current += step;
          if (current >= target) {
            el.textContent = target;
            clearInterval(interval);
          } else {
            el.textContent = current;
          }
        }, 18);
        countObserver.unobserve(el);
      }
    });
  }, { threshold: 0.4 });
  counters.forEach((counter) => countObserver.observe(counter));

  const animateItems = document.querySelectorAll('[data-animate]');
  const animationObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-fade-in');
        animationObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });
  animateItems.forEach((item) => animationObserver.observe(item));
});

function scrollToContact() {
  const el = document.querySelector('#contact');
  if (el) {
    el.scrollIntoView({ behavior: 'smooth' });
  }
}

(function () {
  const style = document.createElement('style');
  style.innerHTML = `
    .fade-out { opacity: 0; transition: opacity 0.5s ease; }
    .animate-fade-in { opacity: 1 !important; transform: translateY(0) !important; }
    [data-animate] { opacity: 0; transform: translateY(24px); transition: opacity 0.75s ease, transform 0.75s ease; }
  `;
  document.head.appendChild(style);
})();
