$descriptions = @{
    'index.html' = 'MMKS Digital Marketing Agency delivers premium social media, SEO, ads, branding, web development, AI solutions and lead generation for Tamil Nadu businesses.'
    'about.html' = 'Learn about MMKS Digital Marketing Agency, founders Sankaranarayanan and Kabilal, company values, mission, and growth journey from Kovilpatti.'
    'contact.html' = 'Contact MMKS Digital Marketing Agency for digital marketing, SEO, ads, branding and web development services in Tamil Nadu.'
    'portfolio.html' = 'View MMKS Digital Marketing Agency''s portfolio projects including SJ Design Agency, PowerBuild Hardware, Trend Wear Fashion and more.'
    'testimonials.html' = 'Read client reviews and success stories from MMKS Digital Marketing Agency customers across Tamil Nadu.'
    'careers.html' = 'Join MMKS Agency - open roles in digital marketing, web development, design and more.'
    'services/ai-solutions.html' = 'Smart AI solutions for modern businesses including chatbots, automation, content creation, WhatsApp automation and lead marketing systems.'
    'services/google-ads.html' = 'Reach customers instantly through Google Ads with search, display, YouTube, shopping and remarketing campaign management.'
    'services/content-marketing.html' = 'Content that builds trust and drives sales with strategy, blogs, social content, marketing content and copywriting.'
    'services/branding.html' = 'Build a strong brand identity with logo design, brand guidelines, color palette and business branding services.'
    'services/lead-generation.html' = 'Generate high quality leads consistently with lead funnels, landing pages, WhatsApp leads, Facebook leads, Google leads and CRM integration.'
    'services/meta-ads.html' = 'Generate more leads with high-converting Meta ads on Facebook and Instagram through MMKS expert campaigns.'
    'services/poster-design.html' = 'Creative posters that grab attention instantly for social media, festivals, product launches and business promotions.'
    'services/seo-services.html' = 'Rank higher on Google with MMKS SEO services for Tamil Nadu businesses using simple, practical search improvements.'
    'services/social-media-marketing.html' = 'Grow your brand through powerful social media marketing with Instagram, Facebook, reels, and engagement strategies.'
    'services/web-development.html' = 'Professional websites that convert visitors into customers with responsive, fast and premium web development services.'
}

$root = Get-Location
Get-ChildItem -Path $root -Recurse -Filter *.html | ForEach-Object {
    $file = $_.FullName
    $rel = $file.Substring($root.Path.Length + 1) -replace '\\', '/'
    $text = Get-Content -Path $file -Raw
    $description = if ($descriptions.ContainsKey($rel)) { $descriptions[$rel] } else { 'Get premium digital marketing services from MMKS Agency.' }

    if ($text -notmatch '<meta name="description" content="[^"]+"\s*/>') {
        $descLine = '  <meta name="description" content=        $text = [regex]::Replace($text, '(<title>[^<]+</title>)', "$1`r`n$descLine")
    }
    if ($text -notmatch '<meta name="robots"') {
        $text = [regex]::Replace($text, '(<meta name="description" content="[^"]+"\s*/>)', "$1`r`n  <meta name=\"robots\" content=\"index, follow\" />")
    }
    if ($text -notmatch '<link rel="canonical"') {
        $url = if ($rel -eq 'index.html') { 'https://mmksagency.example.com/' } else { 'https://mmksagency.example.com/' + $rel }
        $text = [regex]::Replace($text, '(<meta name="robots" content="index, follow"\s*/>)', "$1`r`n  <link rel=\"canonical\" href=\"$url\" />")
    }
    if ($text -notmatch '<meta property="og:title"') {
        if ($text -match '<title>([^<]+)</title>') { $title = $matches[1] } else { $title = $_.BaseName }
        $url = if ($rel -eq 'index.html') { 'https://mmksagency.example.com/' } else { 'https://mmksagency.example.com/' + $rel }
        $og = '  <meta property="og:title" content="' + $title + '" />' + [Environment]::NewLine
        $og += '  <meta property="og:description" content="' + $description + '" />' + [Environment]::NewLine
        $og += '  <meta property="og:type" content="website" />' + [Environment]::NewLine
        $og += '  <meta property="og:url" content="' + $url + '" />' + [Environment]::NewLine
        $og += '  <meta property="og:image" content="https://mmksagency.example.com/og-image.png" />' + [Environment]::NewLine
        $og += '  <meta name="twitter:card" content="summary_large_image" />'
        $text = [regex]::Replace($text, '(<link rel="canonical" href="[^"]+"\s*/>)', "$1`r`n$og")
\s*/>)', '$1' + [Environment]::NewLine + $og)
    }
    Set-Content -Path $file -Value $text -Encoding utf8
    Write-Output "Updated $rel"
}
