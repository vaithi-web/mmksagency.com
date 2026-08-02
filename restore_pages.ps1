function Get-Nav($isServicePage) {
    if ($isServicePage) {
        return @"
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3">
    <div class="container">
      <a class="navbar-brand" href="../index.html">MMKS Agency</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu"><span class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" id="navMenu">
        <ul class="navbar-nav ms-auto align-items-lg-center">
          <li class="nav-item"><a class="nav-link" href="../index.html">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="../about.html">About</a></li>
          <li class="nav-item"><a class="nav-link" href="../careers.html">Careers</a></li>
          <li class="nav-item"><a class="nav-link" href="../portfolio.html">Portfolio</a></li>
          <li class="nav-item"><a class="nav-link" href="../contact.html">Contact</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="../index.html#services" role="button" data-bs-toggle="dropdown">Services</a>
            <ul class="dropdown-menu dropdown-menu-end bg-light border-0 shadow-lg">
              <li><a class="dropdown-item text-dark" href="social-media-marketing.html">Social Media Marketing</a></li>
              <li><a class="dropdown-item text-dark" href="seo-services.html">SEO Services</a></li>
              <li><a class="dropdown-item text-dark" href="meta-ads.html">Meta Ads</a></li>
              <li><a class="dropdown-item text-dark" href="google-ads.html">Google Ads</a></li>
              <li><a class="dropdown-item text-dark" href="web-development.html">Web Development</a></li>
              <li><a class="dropdown-item text-dark" href="branding.html">Branding</a></li>
              <li><a class="dropdown-item text-dark" href="poster-design.html">Poster Design</a></li>
              <li><a class="dropdown-item text-dark" href="content-marketing.html">Content Marketing</a></li>
              <li><a class="dropdown-item text-dark" href="lead-generation.html">Lead Generation</a></li>
              <li><a class="dropdown-item text-dark" href="ai-solutions.html">AI Solutions</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
"@
    }
    return @"
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3">
    <div class="container">
      <a class="navbar-brand" href="index.html">MMKS Agency</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu"><span class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" id="navMenu">
        <ul class="navbar-nav ms-auto align-items-lg-center">
          <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
          <li class="nav-item"><a class="nav-link" href="careers.html">Careers</a></li>
          <li class="nav-item"><a class="nav-link" href="portfolio.html">Portfolio</a></li>
          <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#services" role="button" data-bs-toggle="dropdown">Services</a>
            <ul class="dropdown-menu dropdown-menu-end bg-light border-0 shadow-lg">
              <li><a class="dropdown-item text-dark" href="services/social-media-marketing.html">Social Media Marketing</a></li>
              <li><a class="dropdown-item text-dark" href="services/seo-services.html">SEO Services</a></li>
              <li><a class="dropdown-item text-dark" href="services/meta-ads.html">Meta Ads</a></li>
              <li><a class="dropdown-item text-dark" href="services/google-ads.html">Google Ads</a></li>
              <li><a class="dropdown-item text-dark" href="services/web-development.html">Web Development</a></li>
              <li><a class="dropdown-item text-dark" href="services/branding.html">Branding</a></li>
              <li><a class="dropdown-item text-dark" href="services/poster-design.html">Poster Design</a></li>
              <li><a class="dropdown-item text-dark" href="services/content-marketing.html">Content Marketing</a></li>
              <li><a class="dropdown-item text-dark" href="services/lead-generation.html">Lead Generation</a></li>
              <li><a class="dropdown-item text-dark" href="services/ai-solutions.html">AI Solutions</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
"@
}

function Get-Footer($isServicePage, $footerText) {
    if ($isServicePage) {
        return @"
  <footer class="footer text-dark">
    <div class="container">
      <div class="row gy-4">
        <div class="col-md-4"><h5>MMKS Digital Marketing Agency</h5><p class="text-muted">$footerText</p></div>
        <div class="col-md-4"><h6>Related Services</h6><ul class="list-unstyled"><li><a href="branding.html">Branding</a></li><li><a href="seo-services.html">SEO Services</a></li></ul></div>
        <div class="col-md-4"><h6>Contact</h6><p class="text-muted mb-0"><i class="fa-solid fa-phone me-2"></i>+91 99999 99999</p></div>
      </div>
      <div class="text-center mt-4 text-muted">&copy; 2026 MMKS Digital Marketing Agency.</div>
    </div>
  </footer>
"@
    }
    return @"
  <footer class="footer text-dark">
    <div class="container">
      <div class="row gy-4">
        <div class="col-md-4"><h5>MMKS Digital Marketing Agency</h5><p class="text-muted">$footerText</p></div>
        <div class="col-md-4"><h6>Services</h6><ul class="list-unstyled"><li><a href="services/web-development.html">Web Development</a></li><li><a href="services/seo-services.html">SEO Services</a></li></ul></div>
        <div class="col-md-4"><h6>Contact</h6><p class="text-muted mb-0"><i class="fa-solid fa-phone me-2"></i>+91 99999 99999</p></div>
      </div>
      <div class="text-center mt-4 text-muted">&copy; 2026 MMKS Digital Marketing Agency.</div>
    </div>
  </footer>
"@
}

function Write-Page {
    param(
        [string]$FilePath,
        [string]$Title,
        [string]$Description,
        [string]$Canonical,
        [string]$OgTitle,
        [string]$OgDescription,
        [string]$HeroTitle,
        [string]$HeroCopy,
        [string]$HeroImage,
        [string]$HeroAlt,
        [string]$HeroButtonText,
        [string]$HeroButtonHref,
        [string]$SectionHtml,
        [string]$FooterText,
        [bool]$IsServicePage = $false
    )

    $basePrefix = if ($IsServicePage) { ".." } else { "." }
    $cssPath = if ($IsServicePage) { "../assets/css/style.css" } else { "assets/css/style.css" }
    $jsPath = if ($IsServicePage) { "../assets/js/scripts.js" } else { "assets/js/scripts.js" }
    $nav = Get-Nav $IsServicePage
    $footer = Get-Footer $IsServicePage $FooterText

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$Title</title>
  <meta name="description" content="$Description" />
  <meta name="robots" content="index, follow" />
  <link rel="canonical" href="$Canonical" />
  <meta property="og:title" content="$OgTitle" />
  <meta property="og:description" content="$OgDescription" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="$Canonical" />
  <meta property="og:image" content="https://mmksagency.example.com/og-image.png" />
  <meta name="twitter:card" content="summary_large_image" />
  <link rel="icon" href="https://mmksagency.example.com/favicon.ico" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.4/css/all.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="$cssPath" />
</head>
<body>
$nav
  <main class="py-5">
    <section class="hero-section text-dark">
      <div class="container">
        <div class="row align-items-center gy-5">
          <div class="col-lg-6" data-animate>
            <div class="frame-card p-5">
              <span class="banner-tag">MMKS Agency</span>
              <h1 class="hero-title mt-4">$HeroTitle</h1>
              <p class="hero-copy mt-4">$HeroCopy</p>
              <div class="d-flex gap-3 flex-wrap mt-4">
                <a href="$HeroButtonHref" class="btn btn-primary btn-lg">$HeroButtonText</a>
                <a href="${basePrefix}/contact.html" class="btn btn-outline-primary btn-lg">Contact Us</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="frame-card p-0 overflow-hidden">
              <img src="$HeroImage" alt="$HeroAlt" class="img-fluid w-100 rounded-5" />
            </div>
          </div>
        </div>
      </div>
    </section>
$SectionHtml
    <section class="py-5 bg-light text-center" data-animate>
      <h2 class="section-title">Ready to take the next step?</h2>
      <p class="text-muted">Our team is ready to help your business stand out with digital marketing that works.</p>
      <a href="${basePrefix}/contact.html" class="btn btn-primary btn-lg">Contact MMKS Agency</a>
    </section>
  </main>
$footer

  <a class="whatsapp-float" href="https://wa.me/918608717184" target="_blank" rel="noreferrer"><i class="fa-brands fa-whatsapp fa-lg"></i></a>
  <button class="back-to-top" aria-label="Back to top"><i class="fa-solid fa-chevron-up"></i></button>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="$jsPath"></script>
</body>
</html>
"@

    $fullPath = Join-Path -Path $PSScriptRoot -ChildPath $FilePath
    $dir = Split-Path -Path $fullPath
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    Set-Content -Path $fullPath -Value $html -Encoding UTF8
}

Write-Host "Regenerating pages..."

Write-Page -FilePath "index.html" -Title "MMKS Digital Marketing Agency | Premium Agency in Tamil Nadu" -Description "MMKS Digital Marketing Agency delivers premium social media, SEO, ads, branding, web development, AI solutions and lead generation for Tamil Nadu businesses." -Canonical "https://mmksagency.example.com/" -OgTitle "MMKS Digital Marketing Agency" -OgDescription "Premium digital marketing for Tamil Nadu startups, local brands, and growing businesses." -HeroTitle "Digital marketing built for Tamil Nadu growth" -HeroCopy "We help local brands get found, generate leads, and grow customer trust with smart websites, ads, SEO, branding and AI-enabled campaigns." -HeroImage "src/hero_page.gif" -HeroAlt "Hero page marketing illustration" -HeroButtonText "Get Started" -HeroButtonHref "contact.html" -SectionHtml @"
    <section class="py-5" id="services">
      <div class="container">
        <h2 class="section-title text-center">Our digital marketing services</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-6 col-lg-4">
            <div class="card-glass p-4 h-100">
              <h5>SEO & Search Visibility</h5>
              <p class="text-muted">Simple, practical SEO improvements that help your business rank in local searches.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="card-glass p-4 h-100">
              <h5>Social Media Growth</h5>
              <p class="text-muted">Engaging social campaigns for Instagram, Facebook and reels that build brand awareness.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="card-glass p-4 h-100">
              <h5>Web Development</h5>
              <p class="text-muted">Fast, modern websites that look premium, load quickly and turn visitors into customers.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="card-glass p-4 h-100">
              <h5>Meta & Google Ads</h5>
              <p class="text-muted">Ad campaigns that reach local buyers on Facebook, Instagram, and Google Search.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="card-glass p-4 h-100">
              <h5>Branding & Design</h5>
              <p class="text-muted">Brand identities, posters, and visuals that make your business look professional.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="card-glass p-4 h-100">
              <h5>Lead Generation</h5>
              <p class="text-muted">WhatsApp, landing page and funnel systems crafted to capture reliable leads.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <img src="src/portfolio-web.png" alt="Local marketing campaign illustration" class="frame-image" />
          </div>
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Marketing that feels local and performs globally</h2>
            <p>From Kovilpatti to Tamil Nadu, we build campaigns that connect with real customers using clear messaging, attractive visuals, and measurable results.</p>
            <p>We focus on fast delivery, better conversion, and ongoing support so your digital presence keeps growing.</p>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Digital marketing, web design, SEO and ad campaigns for growing Tamil Nadu businesses." -IsServicePage $false

Write-Page -FilePath "about.html" -Title "About MMKS Agency | Founders, Vision & Values" -Description "Learn about MMKS Digital Marketing Agency, founders Sankaranarayanan and Kabilal, company values, mission, and growth journey from Kovilpatti." -Canonical "https://mmksagency.example.com/about.html" -OgTitle "About MMKS Agency" -OgDescription "Meet the MMKS Agency founders and learn how we help Tamil Nadu businesses grow with digital marketing, design, and web technology." -HeroTitle "Marketing with a local perspective" -HeroCopy "MMKS Agency is built to serve Tamil Nadu businesses with clarity, practical strategy, and digital marketing that fits local budgets." -HeroImage "src/portfolio-web.png" -HeroAlt "About MMKS Agency founders" -HeroButtonText "Talk to our team" -HeroButtonHref "contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Who we are</h2>
            <p>MMKS Agency is a Tamil Nadu digital marketing studio focused on local business growth through SEO, ads, social media, branding, and web development.</p>
            <p>We believe strong results come from practical work, clean content, and campaigns built around your audience.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4">
              <h5>Our mission</h5>
              <p class="text-muted">Help small businesses win online with better visibility, faster websites, and honest marketing advice.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <div class="row g-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Trusted process</h5>
              <p class="text-muted">We combine research, clear messaging, and measurable campaigns that make sense for your brand.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Experienced support</h5>
              <p class="text-muted">We work with startups, shops, students, and local teams across Tamil Nadu to improve their digital presence.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Clear outcomes</h5>
              <p class="text-muted">Every project focuses on traffic, leads, or conversions — not just flashy visuals.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Marketing strategy, branding, SEO, and websites for Tamil Nadu businesses." -IsServicePage $false

Write-Page -FilePath "careers.html" -Title "Careers | MMKS Agency" -Description "Join MMKS Agency - open roles in digital marketing, web development, design and more." -Canonical "https://mmksagency.example.com/careers.html" -OgTitle "MMKS Agency Careers" -OgDescription "Explore open roles at MMKS Agency and join a growing digital marketing team delivering SEO, websites, branding and ads." -HeroTitle "Build your marketing career with us" -HeroCopy "Join our growing team and help Tamil Nadu businesses succeed with smart digital strategy and strong design." -HeroImage "src/custom web.png" -HeroAlt "Careers at MMKS Agency" -HeroButtonText "Apply now" -HeroButtonHref "contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <h2 class="section-title text-center">Open roles</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Marketing Specialist</h5>
              <p class="text-muted">Create campaigns for SEO, social media, and digital ads that drive strong local results.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Web Designer</h5>
              <p class="text-muted">Design clean, responsive websites and landing pages with a focus on conversion and speed.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Content Creator</h5>
              <p class="text-muted">Write copy, social posts, and campaign content that connects with Tamil Nadu customers.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Why work with us</h2>
            <p>We're a small, friendly team that values honest work, continuous learning, and projects that help real businesses grow.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4">
              <h5>Inclusive environment</h5>
              <p class="text-muted">Flexible roles, collaborative planning, and a focus on career growth.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Join MMKS Agency for digital marketing, web development, and creative growth." -IsServicePage $false

Write-Page -FilePath "contact.html" -Title "Contact MMKS Agency | Digital Marketing Agency in Tamil Nadu" -Description "Contact MMKS Digital Marketing Agency for digital marketing, SEO, ads, branding and web development services in Tamil Nadu." -Canonical "https://mmksagency.example.com/contact.html" -OgTitle "Contact MMKS Agency" -OgDescription "Get in touch with MMKS Agency to start a digital marketing, SEO, branding or web development project in Tamil Nadu." -HeroTitle "Let's talk about your next project" -HeroCopy "Send a message today and let MMKS Agency help you get better visibility, more leads, and a stronger online presence." -HeroImage "src/landing  web.png" -HeroAlt "Contact MMKS Agency" -HeroButtonText "Send message" -HeroButtonHref "contact.html" -SectionHtml @"
    <section class="py-5 bg-light">
      <div class="container">
        <div class="row g-4">
          <div class="col-lg-4" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Email</h5>
              <p class="text-muted">hello@mmksagency.example.com</p>
            </div>
          </div>
          <div class="col-lg-4" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Phone</h5>
              <p class="text-muted">+91 99999 99999</p>
            </div>
          </div>
          <div class="col-lg-4" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Office</h5>
              <p class="text-muted">Kovilpatti, Tamil Nadu</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Contact us for digital marketing, SEO, web development, and ad campaigns." -IsServicePage $false

Write-Page -FilePath "portfolio.html" -Title "Portfolio | MMKS Digital Marketing Agency" -Description "View MMKS Digital Marketing Agency's portfolio projects including SJ Design Agency, PowerBuild Hardware, Trend Wear Fashion and more." -Canonical "https://mmksagency.example.com/portfolio.html" -OgTitle "MMKS Agency Portfolio" -OgDescription "See recent website, branding and marketing projects from MMKS Agency for Tamil Nadu businesses." -HeroTitle "Our recent work" -HeroCopy "Explore portfolio projects that combine local brand strategy with polished design and digital marketing execution." -HeroImage "src/sj_design_agency.jpeg.jpg" -HeroAlt "MMKS Agency portfolio sample" -HeroButtonText "View portfolio" -HeroButtonHref "contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row g-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <img src="src/powerbuild_hardware.jpg" alt="PowerBuild Hardware" class="img-fluid rounded-4 mb-3" />
              <h5>PowerBuild Hardware</h5>
              <p class="text-muted">Web design and local marketing for a hardware service brand.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <img src="src/trendwear_fashion.jpg" alt="Trend Wear Fashion" class="img-fluid rounded-4 mb-3" />
              <h5>Trend Wear Fashion</h5>
              <p class="text-muted">Branding and social media content for a fashion business.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <img src="src/sj_design_agency.jpeg.jpg" alt="SJ Design Agency" class="img-fluid rounded-4 mb-3" />
              <h5>SJ Design Agency</h5>
              <p class="text-muted">Design and website development for creative service providers.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Portfolio case studies for brands across Tamil Nadu." -IsServicePage $false

Write-Page -FilePath "testimonials.html" -Title "Testimonials | MMKS Digital Marketing Agency" -Description "Read client reviews and success stories from MMKS Digital Marketing Agency customers across Tamil Nadu." -Canonical "https://mmksagency.example.com/testimonials.html" -OgTitle "MMKS Agency Testimonials" -OgDescription "Success stories and reviews from businesses that grew with MMKS Agency's digital marketing services." -HeroTitle "What our clients say" -HeroCopy "See how our clients describe working with MMKS Agency on digital marketing, SEO, and website projects." -HeroImage "src/msg.png" -HeroAlt "Client testimonials" -HeroButtonText "Work with us" -HeroButtonHref "contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row g-4">
          <div class="col-md-4" data-animate>
            <div class="card-glass p-4 h-100">
              <p class="text-muted">"MMKS Agency helped us get visible on Google and brought in measurable leads within weeks."</p>
              <p><strong>- Local Retail Owner</strong></p>
            </div>
          </div>
          <div class="col-md-4" data-animate>
            <div class="card-glass p-4 h-100">
              <p class="text-muted">"The team delivered a clean website fast and the brand identity looks premium."</p>
              <p><strong>- Startup Founder</strong></p>
            </div>
          </div>
          <div class="col-md-4" data-animate>
            <div class="card-glass p-4 h-100">
              <p class="text-muted">"Great communication and steady results from social media and ad campaigns."</p>
              <p><strong>- Small Business Owner</strong></p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Client testimonials for our SEO, web, and marketing services." -IsServicePage $false

# Service pages
Write-Page -FilePath "services/seo-services.html" -Title "SEO Services | MMKS Agency" -Description "Rank higher on Google with MMKS SEO services for Tamil Nadu businesses using simple, practical search improvements." -Canonical "https://mmksagency.example.com/services/seo-services.html" -OgTitle "SEO Services | MMKS Agency" -OgDescription "Simple and practical SEO services for Tamil Nadu businesses that want to rank higher and attract local customers." -HeroTitle "SEO that helps local customers find you" -HeroCopy "We improve your search presence with easy-to-manage SEO updates, local listings, and content that matches buyer intent." -HeroImage "../src/portfolio-web.png" -HeroAlt "SEO services illustration" -HeroButtonText "See SEO services" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Practical SEO for Tamil Nadu businesses</h2>
            <p>We focus on search terms your customers use and optimize your website so local shoppers can find you easily.</p>
            <p>From page speed to page copy, our SEO work is built to deliver steady organic traffic without complex jargon.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>What we cover</h5>
              <ul class="text-muted">
                <li>Keyword optimization</li>
                <li>Local SEO and Google Business Profile</li>
                <li>Technical checks and speed improvements</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">SEO that keeps working</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Search copy</h5>
              <p class="text-muted">Content written for users and search engines to improve clicks and conversions.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Local visibility</h5>
              <p class="text-muted">Google Business and local landing pages that help nearby customers choose you.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Performance checks</h5>
              <p class="text-muted">Improving website speed, structure, and mobile usability for better search results.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "SEO services for better search visibility and local growth." -IsServicePage $true

Write-Page -FilePath "services/content-marketing.html" -Title "Content Marketing | MMKS Agency" -Description "Content that builds trust and drives sales with strategy, blogs, social content, marketing content and copywriting." -Canonical "https://mmksagency.example.com/services/content-marketing.html" -OgTitle "Content Marketing | MMKS Agency" -OgDescription "Content marketing and copywriting for Tamil Nadu brands that want to build trust and convert more visitors." -HeroTitle "Content that builds trust and sales" -HeroCopy "We create content that connects with your audience and supports SEO, social, email, and brand campaigns." -HeroImage "../src/custom web.png" -HeroAlt "Content marketing illustration" -HeroButtonText "Talk content" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Content for every channel</h2>
            <p>From blogs and social posts to landing page copy, our content is written to help people trust your brand and take action.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Our approach</h5>
              <ul class="text-muted">
                <li>Audience-first messaging</li>
                <li>SEO-aware structure</li>
                <li>Clear sales focus</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Copy that converts</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Blog strategy</h5>
              <p class="text-muted">Content that brings traffic, keeps readers engaged, and answers customer questions.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Social content</h5>
              <p class="text-muted">Short-form posts and reels that are easy to publish and built for engagement.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Landing pages</h5>
              <p class="text-muted">High-converting page copy for services, offers, and lead capture flows.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Content marketing and copywriting that supports SEO, ads, and sales." -IsServicePage $true

Write-Page -FilePath "services/web-development.html" -Title "Web Development | MMKS Agency" -Description "Professional websites that convert visitors into customers with responsive, fast and premium web development services." -Canonical "https://mmksagency.example.com/services/web-development.html" -OgTitle "Web Development | MMKS Agency" -OgDescription "Premium web development services for Tamil Nadu businesses that want websites with speed, style, and conversions." -HeroTitle "Beautiful websites that work for your business" -HeroCopy "We build responsive websites with premium visuals, fast performance, and user-friendly layouts optimized for conversions." -HeroImage "../src/web-dev-01.png" -HeroAlt "Web development illustration" -HeroButtonText "Build my website" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Websites built to convert</h2>
            <p>From landing pages to full brand websites, we create digital experiences that support sales, lead generation and trust.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Development focus</h5>
              <ul class="text-muted">
                <li>Responsive design</li>
                <li>Fast page loads</li>
                <li>SEO friendly structure</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Launch with confidence</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Modern design</h5>
              <p class="text-muted">Clean, professional layouts tailored to your brand identity.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Performance</h5>
              <p class="text-muted">Optimized structure and images for fast loading on all devices.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Maintenance support</h5>
              <p class="text-muted">Ongoing updates and improvements after launch.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Web development services for Tamil Nadu businesses and brands." -IsServicePage $true

Write-Page -FilePath "services/social-media-marketing.html" -Title "Social Media Marketing | MMKS Agency" -Description "Grow your brand through powerful social media marketing with Instagram, Facebook, reels, and engagement strategies." -Canonical "https://mmksagency.example.com/services/social-media-marketing.html" -OgTitle "Social Media Marketing | MMKS Agency" -OgDescription "Social media marketing for Tamil Nadu brands that want more reach, engagement and leads." -HeroTitle "Social media campaigns that connect" -HeroCopy "We create social media content and ad strategies that build awareness, engagement, and customer interest." -HeroImage "../src/landing  web.png" -HeroAlt "Social media marketing illustration" -HeroButtonText "Talk social marketing" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Grow your social presence</h2>
            <p>We manage campaigns for Instagram, Facebook, Reels, and messaging to help you reach customers where they spend time.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>What we deliver</h5>
              <ul class="text-muted">
                <li>Content planning</li>
                <li>Ad optimization</li>
                <li>Audience targeting</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Social campaigns that perform</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Reels & posts</h5>
              <p class="text-muted">Creative content made to attract attention and build trust.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Ad campaigns</h5>
              <p class="text-muted">Targeted ads to bring in leads and website visits quickly.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Insights</h5>
              <p class="text-muted">Reports and practical advice so your social strategy keeps improving.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Social media and engagement services for growing brands." -IsServicePage $true

Write-Page -FilePath "services/google-ads.html" -Title "Google Ads | MMKS Agency" -Description "Reach customers instantly through Google Ads with search, display, YouTube, shopping and remarketing campaign management." -Canonical "https://mmksagency.example.com/services/google-ads.html" -OgTitle "Google Ads | MMKS Agency" -OgDescription "Google Ads management for Tamil Nadu businesses that want more leads and sales from search and display campaigns." -HeroTitle "Get instant visibility with Google Ads" -HeroCopy "We run search and display campaigns to reach people who are actively searching for your services." -HeroImage "../src/portfolio-web.png" -HeroAlt "Google Ads illustration" -HeroButtonText "Start Google Ads" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Ads built for local search</h2>
            <p>We target the right keywords and audiences so your ads show to people ready to buy or inquire now.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Campaign focus</h5>
              <ul class="text-muted">
                <li>Search ads</li>
                <li>Display campaigns</li>
                <li>Remarketing</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Ads with measurable results</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Search visibility</h5>
              <p class="text-muted">Put your business in front of buyers at the moment they search.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Display ads</h5>
              <p class="text-muted">Reach customers with visual campaigns that drive awareness.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Performance</h5>
              <p class="text-muted">Regular optimization to improve click costs and campaign outcomes.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Google Ads and search marketing for fast local growth." -IsServicePage $true

Write-Page -FilePath "services/meta-ads.html" -Title "Meta Ads | MMKS Agency" -Description "Generate more leads with high-converting Meta ads on Facebook and Instagram through MMKS expert campaigns." -Canonical "https://mmksagency.example.com/services/meta-ads.html" -OgTitle "Meta Ads | MMKS Agency" -OgDescription "Facebook and Instagram Meta Ads management for Tamil Nadu businesses that want more leads and sales." -HeroTitle "High-converting Meta Ads" -HeroCopy "We create Meta ad campaigns that deliver visibility, clicks, and lead capture on Facebook and Instagram." -HeroImage "../src/landing  web.png" -HeroAlt "Meta Ads illustration" -HeroButtonText "Run Meta Ads" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Ads for social buyers</h2>
            <p>Using Meta's targeting tools, we reach people likely to engage with your brand and become customers.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Campaign highlights</h5>
              <ul class="text-muted">
                <li>Instagram ads</li>
                <li>Facebook ads</li>
                <li>Audience testing</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Social ad campaigns that perform</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Lead campaigns</h5>
              <p class="text-muted">Capture customer details with forms and landing page events.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Creative ads</h5>
              <p class="text-muted">Visual ads and copy that stand out in feeds.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Optimized budgets</h5>
              <p class="text-muted">Monitor and adjust bids to improve campaign efficiency.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Meta advertising for Facebook and Instagram that brings leads." -IsServicePage $true

Write-Page -FilePath "services/lead-generation.html" -Title "Lead Generation | MMKS Agency" -Description "Generate high quality leads consistently with lead funnels, landing pages, WhatsApp leads, Facebook leads, Google leads and CRM integration." -Canonical "https://mmksagency.example.com/services/lead-generation.html" -OgTitle "Lead Generation | MMKS Agency" -OgDescription "Lead generation systems for Tamil Nadu businesses using landing pages, WhatsApp, Google and Facebook leads." -HeroTitle "Lead generation that keeps your funnel full" -HeroCopy "We build lead-ready campaigns with proven landing pages, WhatsApp workflows, and ad funnels that attract interested customers." -HeroImage "../src/portfolio-web.png" -HeroAlt "Lead generation illustration" -HeroButtonText "Generate leads" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Leads that become customers</h2>
            <p>We combine landing page design, ad targeting, and messaging to capture leads that are ready to talk.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Lead systems</h5>
              <ul class="text-muted">
                <li>WhatsApp funnels</li>
                <li>Landing pages</li>
                <li>CRM setup</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Convert interest into action</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>High-quality leads</h5>
              <p class="text-muted">We attract people ready to inquire or buy, not just casual visitors.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Lead nurture</h5>
              <p class="text-muted">WhatsApp and follow-up messaging that keeps prospects engaged.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Conversion focus</h5>
              <p class="text-muted">Every page and ad is designed to move people closer to contact.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Lead generation for high-quality enquiries and customer growth." -IsServicePage $true

Write-Page -FilePath "services/branding.html" -Title "Branding | MMKS Agency" -Description "Build a strong brand identity with logo design, brand guidelines, color palette and business branding services." -Canonical "https://mmksagency.example.com/services/branding.html" -OgTitle "Branding | MMKS Agency" -OgDescription "Branding and identity services for Tamil Nadu businesses that need a polished, professional image." -HeroTitle "Branding that makes your business memorable" -HeroCopy "We create logos, brand palettes, and visual systems that help your business stand out with confidence." -HeroImage "../src/portfolio-web.png" -HeroAlt "Branding services illustration" -HeroButtonText "Start branding" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Strong brand identity</h2>
            <p>Great branding creates trust, consistency, and a professional impression for customers.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Brand services</h5>
              <ul class="text-muted">
                <li>Logo & mark</li>
                <li>Color palette</li>
                <li>Brand guidelines</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">A consistent visual identity</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Logo design</h5>
              <p class="text-muted">Clean, modern logo marks that suit your business and audience.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Brand guidelines</h5>
              <p class="text-muted">A simple visual system for colors, fonts, and layout choices.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Marketing assets</h5>
              <p class="text-muted">Posters, social posts, and brand visuals that feel coherent and polished.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Brand strategy, logo design, and visual identity." -IsServicePage $true

Write-Page -FilePath "services/poster-design.html" -Title "Poster Design | MMKS Agency" -Description "Creative posters that grab attention instantly for social media, festivals, product launches and business promotions." -Canonical "https://mmksagency.example.com/services/poster-design.html" -OgTitle "Poster Design | MMKS Agency" -OgDescription "Poster design services for eye-catching digital and print promotion in Tamil Nadu." -HeroTitle "Poster design that grabs attention" -HeroCopy "We design posters and visuals for social media, events, promotions, and local campaigns that stop scrolls." -HeroImage "../src/portfolio-web.png" -HeroAlt "Poster design illustration" -HeroButtonText "Create a poster" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">Fast, visual marketing assets</h2>
            <p>From festival posters to product launch graphics, we create designs that are easy to publish and share.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>Design focus</h5>
              <ul class="text-muted">
                <li>Bold imagery</li>
                <li>Clear messaging</li>
                <li>Fast turnaround</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Visuals that perform</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Event posters</h5>
              <p class="text-muted">Festivals, launches, and local promotions with strong visual impact.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Social graphics</h5>
              <p class="text-muted">Poster-style social content for fast attention and shares.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Print-ready files</h5>
              <p class="text-muted">Ready for print or digital publishing with clean layout and visual hierarchy.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "Poster and design services for promotions and campaigns." -IsServicePage $true

Write-Page -FilePath "services/ai-solutions.html" -Title "AI Solutions | MMKS Agency" -Description "Smart AI solutions for modern businesses including chatbots, automation, content creation, WhatsApp automation and lead marketing systems." -Canonical "https://mmksagency.example.com/services/ai-solutions.html" -OgTitle "AI Solutions | MMKS Agency" -OgDescription "AI marketing and automation solutions to make business processes faster and more efficient." -HeroTitle "AI solutions for smarter marketing" -HeroCopy "From chatbots to content automation, we help businesses use AI tools to save time and engage customers better." -HeroImage "../src/portfolio-web.png" -HeroAlt "AI solutions illustration" -HeroButtonText "Explore AI" -HeroButtonHref "../contact.html" -SectionHtml @"
    <section class="py-5">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6" data-animate>
            <h2 class="section-title">AI for business efficiency</h2>
            <p>We design automation solutions using chatbots, content helpers, and lead workflows to make your marketing faster and easier to manage.</p>
          </div>
          <div class="col-lg-6" data-animate>
            <div class="card-glass p-4 h-100">
              <h5>AI services</h5>
              <ul class="text-muted">
                <li>Chatbots</li>
                <li>WhatsApp automation</li>
                <li>AI content tools</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-light">
      <div class="container">
        <h2 class="section-title text-center">Smarter workflows</h2>
        <div class="row g-4 mt-4">
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Chat automation</h5>
              <p class="text-muted">Help customers instantly with guided chat flows for support and leads.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Content speed</h5>
              <p class="text-muted">Use AI-assisted content creation to keep your website and social channels fresh.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-glass p-4 h-100">
              <h5>Process automation</h5>
              <p class="text-muted">Streamline lead capture, follow-ups, and campaign reporting with automation.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
"@ -FooterText "AI-powered marketing and automation services." -IsServicePage $true

Write-Host "Page regeneration complete."
