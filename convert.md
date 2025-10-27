# Convert command
## Resize & Convert to Other Type:

`convert input_image.jpg -resize 1200x900! -quality 80 output_image.webp`

## Percentage scaling:

`convert department-single.webp -resize 40% department-card.webp`

# Bulk conversion:

`mogrify -format webp *.png`

# Image to text:

`tesseract example.png text`
