$root = Get-Item .
$pages = Get-ChildItem -Path . -Filter *.html -Recurse | Where-Object { $_.Name -ne 'index.html' }
foreach ($page in $pages) {
    $content = Get-Content -Raw -Path $page.FullName
    $regex = [regex] '<section class="hero-section">([\s\S]*?)</section>'
    $evaluator = {
        param($m)
        $inner = $m.Groups[1].Value
        if ($inner -match '<h1[^>]*>([\s\S]*?)</h1>') { $title = $matches[1].Trim() } else { $title = '' }
        if ($inner -match '<p[^>]*>([\s\S]*?)</p>') { $copy = $matches[1].Trim() } else { $copy = '' }
        $imgPath = if ($page.DirectoryName -eq $root.FullName) { 'src/hero_page.gif' } else { '../src/hero_page.gif' }
        return @"
        <section class="hero-section">
      <div class="container">
        <div class="row align-items-center gy-4">
          <div class="col-lg-6">
            <h1 class="hero-title">$title</h1>
            <p class="hero-copy">$copy</p>
          </div>
          <div class="col-lg-6">
            <img src="$imgPath" alt="Hero image" class="frame-image" />
          </div>
        </div>
      </div>
    </section>
"@
    }
    $newContent = $regex.Replace($content, $evaluator, 1)
    if ($newContent -ne $content) {
        Set-Content -Path $page.FullName -Value $newContent
        Write-Host "Updated hero layout in $($page.Name)"
    }
}
