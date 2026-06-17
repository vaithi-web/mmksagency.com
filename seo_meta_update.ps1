$root = Get-Location
Get-ChildItem -Path $root -Recurse -Filter *.html | ForEach-Object {
    $file = $_.FullName
    $content = Get-Content $file -Raw
    if ($content -notmatch '<meta name="description" content="([^\"]+)"\s*/>') { return }
    $description = $matches[1]
    $hasRobots = $content -match '<meta name="robots"'
    $hasCanonical = $content -match '<link rel="canonical"'
    $hasOg = $content -match '<meta property="og:title"'
    $relPath = $file.Substring($root.Path.Length + 1) -replace '\\','/'
    $url = "https://mmksagency.example.com/$relPath"
    if ($_.Name -eq 'index.html') { $url = 'https://mmksagency.example.com/' }
    $insert = ""
    if (-not $hasRobots) { $insert += '  <meta name="robots" content="index, follow" />`n' }
    if (-not $hasCanonical) { $insert += "  <link rel=`"canonical`" href=`"$url`" />`n" }
    if (-not $hasOg) {
      if ($content -match '<title>([^<]+)</title>') { $title = $matches[1] } else { $title = $_.BaseName }
      $insert += "  <meta property=`"og:title`" content=`"$title`" />`n"
      $insert += "  <meta property=`"og:description`" content=`"$description`" />`n"
      $insert += '  <meta property="og:type" content="website" />`n'
      $insert += "  <meta property=`"og:url`" content=`"$url`" />`n"
      $insert += '  <meta property="og:image" content="https://mmksagency.example.com/og-image.png" />`n'
      $insert += '  <meta name="twitter:card" content="summary_large_image" />`n'
    }
    if ($insert) {
      $newContent = $content -replace '(<meta name="description" content="[^"]+"\s*/>)', "$1`n$insert"
      Set-Content -Path $file -Value $newContent -Encoding utf8
      Write-Output "Updated $file"
    }
}
