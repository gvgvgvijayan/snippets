# Directory Listing & File Switching:
- `:E`

# Filename with scrolled percentage:
- `:f`

# Copy URL from Sitemap XML:
- `:let @+='' | g/https:[^<]\+/call setreg('+', [matchstr(getline('.'), 'https:[^<]\+')], 'a')`
