from pathlib import Path
import re

base = Path(r'C:\Users\anand\OneDrive\Desktop\new\services')
files = sorted(base.glob('*.html'))

for path in files:
    text = path.read_text(encoding='utf-8')
    original = text

    # viewport
    text = re.sub(r'<meta name="viewport" content="[^"]*viewport-fit=cover"\s*/?>',
                  '<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />', text)
    # theme color
    if 'meta name="theme-color"' not in text:
        text = text.replace('<meta name="robots" content="index, follow" />\n',
                            '<meta name="robots" content="index, follow" />\n  <meta name="theme-color" content="#ff6b35" />\n')
    # og and twitter tags
    if 'meta property="og:site_name"' not in text:
        text = text.replace('<link rel="canonical" href="',
                            '<link rel="canonical" href="')
    if 'meta property="og:site_name"' not in text and 'meta property="og:title"' in text:
        text = text.replace('  <meta property="og:title" content="',
                            '  <meta property="og:site_name" content="MMKS Agency" />\n  <meta property="og:title" content="')
    if 'meta property="og:image:alt"' not in text and 'meta property="og:image"' in text:
        text = text.replace('  <meta property="og:image" content="https://mmksagency.example.com/og-image.png" />\n',
                            '  <meta property="og:image" content="https://mmksagency.example.com/og-image.png" />\n  <meta property="og:image:alt" content="MMKS Agency marketing services" />\n')
    if 'meta name="twitter:title"' not in text and 'meta name="twitter:card" content="summary_large_image"' in text:
        text = text.replace('  <meta name="twitter:card" content="summary_large_image" />\n',
                            '  <meta name="twitter:card" content="summary_large_image" />\n  <meta name="twitter:title" content="' + re.search(r'<title>([^<]+)</title>', text).group(1) + '" />\n  <meta name="twitter:description" content="' + re.search(r'<meta name="description" content="([^"]*)"', text).group(1) + '" />\n  <meta name="twitter:image" content="https://mmksagency.example.com/og-image.png" />\n')

    # nav ARIA
    text = text.replace('<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3">',
                        '<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" aria-label="Primary navigation">')
    text = text.replace('data-bs-toggle="collapse" data-bs-target="#navMenu">',
                        'data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">')
    text = re.sub(r'<a class="nav-link dropdown-toggle" href="([^"]+)" role="button" data-bs-toggle="dropdown">',
                  r'<a class="nav-link dropdown-toggle" href="\1" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">', text)

    # body duplicates
    text = re.sub(r'<body>\s*<body>', '<body>', text)

    # remove stray backslashes before footer
    text = text.replace('\n  \\ \\n    <footer', '\n  <footer')
    text = text.replace('  \\ \\n    <footer', '  <footer')
    text = text.replace('  \\ \\', '')
    text = text.replace('\\ \\n', '')
    text = text.replace('  \\', '')

    # footer headings and copyright
    def replace_footer_sections(match):
        footer = match.group(0)
        footer = footer.replace('<h5 class="mb-3">', '<h3 class="h5 mb-3">')
        footer = footer.replace('<h6 class="mb-3">', '<h4 class="h6 mb-3">')
        footer = footer.replace('�', '&copy;')
        return footer

    text = re.sub(r'<footer[\s\S]*?</footer>', replace_footer_sections, text)

    # service cards and process steps
    text = re.sub(r'<h5 class="fw-bold mb-2">', '<p class="fw-bold mb-2">', text)
    text = re.sub(r'<h5 class="fw-bold mt-3">', '<p class="fw-bold mt-3">', text)
    text = re.sub(r'</h5>', '</p>', text)
    text = re.sub(r'<h6 class="fw-bold">', '<p class="fw-bold mb-0">', text)
    text = text.replace('</h6>', '</p>')

    # service active aria-current
    filename = path.name
    text = text.replace(f'<li><a class="dropdown-item" href="{filename}">', f'<li><a class="dropdown-item" href="{filename}" aria-current="page">')

    # update og:image alt if generic
    text = text.replace('content="MMKS Agency marketing services"', 'content="MMKS Agency marketing services"')

    if text != original:
        path.write_text(text, encoding='utf-8')
        print(f'Updated {path.name}')
    else:
        print(f'No change {path.name}')
