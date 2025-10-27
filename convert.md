# Convert command
## Resize & Convert to Other Type:

`convert input_image.jpg -resize 1200x900! -quality 80 output_image.webp`

## Percentage scaling:

`convert department-single.webp -resize 40% department-card.webp`

## Slice image into multiple sections:

`convert department-single.png -crop 1x4@ +repage department-single-part-%d.webp`

# Bulk conversion:

`mogrify -format webp *.png`

# Image to text:

`tesseract example.png text`
