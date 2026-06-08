import pathlib
import re
root = pathlib.Path('.').resolve()
for path in root.rglob('*.html'):
    text = path.read_text(encoding='utf-8')
    if '<meta name="description" content="' not in text:
        continue
    if '<meta name="robots"' in text and '<link rel="canonical"' in text and '<meta property="og:title"' in text:
        continue
    m = re.search(r'(<meta name="description" content="([^"]+)"\s*/>)', text)
    if not m:
        continue
    description = m.group(2)
    relPath = str(path.relative_to(root)).replace('\\', '/')
    url = 'https://mmksagency.example.com/' + relPath
    if path.name == 'index.html':
        url = 'https://mmksagency.example.com/'
    title_match = re.search(r'<title>([^<]+)</title>', text)
    title = title_match.group(1) if title_match else path.stem
    parts = []
    if '<meta name="robots"' not in text:
        parts.append('  <meta name="robots" content="index, follow" />')
    if '<link rel="canonical"' not in text:
        parts.append(f'  <link rel="canonical" href="{url}" />')
    if '<meta property="og:title"' not in text:
        parts.extend([
            f'  <meta property="og:title" content="{title}" />',
            f'  <meta property="og:description" content="{description}" />',
            '  <meta property="og:type" content="website" />',
            f'  <meta property="og:url" content="{url}" />',
            '  <meta property="og:image" content="https://mmksagency.example.com/og-image.png" />',
            '  <meta name="twitter:card" content="summary_large_image" />',
        ])
    insert = '\n'.join(parts) + '\n'
    new_text = text.replace(m.group(1), m.group(1) + '\n' + insert)
    path.write_text(new_text, encoding='utf-8')
    print(f'Updated {path}')
