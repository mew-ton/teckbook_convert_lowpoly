#!/bin/sh

# create pdfs
img2pdf src/root/images/cover.jpg --output dist/cover.pdf
pandoc -d config.pandoc.yml -o dist/docs.pdf src/**/*.md

# merge pdf
pdfunite dist/cover.pdf dist/docs.pdf dist/output.pdf

# edit metadatas
exiftool dist/output.pdf \
    -Title="ローポリ化改変備忘録" \
    -Keywords="VRChat vrchat VRC vrc Avatar Occurus Quest Unity Blender" \
    -Author="みゅーとん" \
    -Producer="pandoc wkhtmltopdf img2pdf pdfunite" \
    -CreateDate="$(date --iso-8601="seconds")" \
    -Marked="True" \
    -rights="© 2021 みゅーとん" \
    -lang ja
