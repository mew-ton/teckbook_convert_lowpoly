#!/bin/sh

# create pdfs
pandoc -d config.pandoc.yml -o docs.html src/**/*.md
pandoc -d config.pandoc.yml -o dist/docs.pdf src/**/*.md

# merge pdf
pdftk src/root/cover.pdf dist/docs.pdf cat output dist/output.pdf

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
rm dist/docs.pdf