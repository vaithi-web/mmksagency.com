$files = Get-ChildItem -Path .\services\*.html
foreach ($f in $files) {
    $text = Get-Content -Path $f.FullName -Raw
    $orig = $text

    # Viewport
    $text = [regex]::Replace($text, '<meta name="viewport" content="[^"]*viewport-fit=cover"\s*/?>', '<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />')

    # Theme color
    if ($text -notmatch 'meta name="theme-color"') {
        $text = $text -replace '(<meta name="robots" content="index, follow" />)', '$1`r`n  <meta name="theme-color" content="#ff6b35" />'
    }

    # OG site name
    if ($text -notmatch 'meta property="og:site_name"') {
        $text = $text -replace '(<meta property="og:title" content="[^"]+" />)', '  <meta property="og:site_name" content="MMKS Agency" />`r`n$1'
    }

    # OG image alt
    if ($text -notmatch 'meta property="og:image:alt"') {
        $text = $text -replace '(<meta property="og:image" content="[^"]+" />)', '$1`r`n  <meta property="og:image:alt" content="MMKS Agency marketing services" />'
    }

    # Twitter meta tags
    if ($text -match '<meta name="description" content="([^"]*)"' -and $text -match '<title>([^<]+)</title>' -and $text -notmatch 'meta name="twitter:title"') {
        $desc = [regex]::Match($text, '<meta name="description" content="([^"]*)"').Groups[1].Value
        $title = [regex]::Match($text, '<title>([^<]+)</title>').Groups[1].Value
        $insert = @"
  <meta name="twitter:title" content="$title" />
  <meta name="twitter:description" content="$desc" />
  <meta name="twitter:image" content="https://mmksagency.example.com/og-image.png" />
"@
        $text = $text -replace '(<meta name="twitter:card" content="summary_large_image" />)', ('$1`r`n' + $insert.Trim())
    }

    # Navigation accessibility
    $text = $text -replace '<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3">', '<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" aria-label="Primary navigation">'
    $text = $text -replace 'data-bs-toggle="collapse" data-bs-target="#navMenu">', 'data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">'
    $text = $text -replace '<a class="nav-link dropdown-toggle" href="([^"]+)" role="button" data-bs-toggle="dropdown">', '<a class="nav-link dropdown-toggle" href="$1" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'

    # Duplicate body tag
    $text = [regex]::Replace($text, '<body>\s*<body>', '<body>')

    # Stray backslashes before footer
    $text = [regex]::Replace($text, '\r?\n\s*\\\s*\\\s*\r?\n', "`r`n")

    # Decorative heading replacements
    $text = $text -replace '<h5 class="fw-bold mb-2">', '<p class="fw-bold mb-2">'
    $text = $text -replace '<h5 class="fw-bold mt-3">', '<p class="fw-bold mt-3">'
    $text = $text -replace '</h5>', '</p>'
    $text = $text -replace '<h6 class="fw-bold">', '<p class="fw-bold mb-0">'
    $text = $text -replace '</h6>', '</p>'

    # Footer heading semantic levels
    $text = $text -replace '<h5 class="mb-3">', '<h3 class="h5 mb-3">'
    $text = $text -replace '<h6 class="mb-3">', '<h4 class="h6 mb-3">'

    # Invalid copyright char
    $text = $text -replace '�', '&copy;'

    # Active service page aria-current
    $name = $f.Name
    $text = $text -replace ('<li><a class="dropdown-item" href="' + [regex]::Escape($name) + '"'), ('<li><a class="dropdown-item" href="' + $name + '" aria-current="page"')

    if ($text -ne $orig) {
        Set-Content -Path $f.FullName -Value $text -Encoding utf8
        Write-Host "Updated $($f.Name)"
    } else {
        Write-Host "No change $($f.Name)"
    }
}