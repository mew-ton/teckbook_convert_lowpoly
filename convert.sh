#!/bin/sh

# create pdfs
img2pdf src/root/images/cover.jpg --output dist/cover.pdf
pandoc -d config.pandoc.yml -o dist/docs.pdf src/**/*.md

# merge pdf
pdftk dist/cover.pdf dist/docs.pdf cat output dist/output.pdf

# edit metadatas
exiftool dist/output.pdf \
    -Title="PCアバター 5000ポリまでダイエット" \
    -Subtitle="Quest Excellentを目指す本" \
    -Keywords="VRChat vrchat VRC vrc Avatar Occurus Quest Unity Blender" \
    -Author="みゅーとん" \
    -Producer="pandoc wkhtmltopdf img2pdf pdftk" \
    -CreateDate="$(date --iso-8601="seconds")" \
    -Marked="True" \
    -rights="© 2021 みゅーとん" \
    -lang ja

# remove tmp files
rm dist/cover.pdf
rm dist/docs.pdf