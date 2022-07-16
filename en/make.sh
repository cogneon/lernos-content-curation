#PATH=$PATH:/opt/homebrew/bin
echo Starting lernOS Guide Generation ...

# Variables
filename="lernOS-Template-Guide-en"
#chapters="./src/index.md ./src/1-0-Grundlagen.md ./src/1-1-Grundidee.md ./src/1-2-Lebenszyklus.md ./src/1-3-Inhaltsverzeichnis.md ./src/1-4-Inhalt-Schreibstil.md ./src/1-5-Markdown-Syntax.md ./src/1-6-Produktionskette.md ./src/1-7-Github.md ./src/2-0-Lernpfad.md ./src/3-0-Anhang.md"

chapters="./src/index.md ./src/1-0-Grundlagen.md ./src/2-0-Lernpfad.md ./src/2-1-Woche-0.md ./src/2-2-Woche-1.md ./src/2-3-Woche-2.md ./src/2-4-Woche-3-4.md ./src/2-6-Woche-5.md ./src/2-7-Woche-6.md ./src/2-8-Woche-7.md ./src/2-9-Woche-8.md ./src/2-10-Woche-9.md ./src/2-11-Woche-10.md ./src/2-12-Woche-11.md ./src/2-13-Woche-12.md ./src/3-0-Anhang.md"

# Delete Old Versions
echo Deleting old versions ...
rm -rf $filename.*
rm -rf ../docs/de/*
rm -ff ../docs/de-slides/index.html

# Create Web Version (mkdocs)
#echo Creating Web Version ...
mkdocs build

# Create Microsoft Word Version (docx)
echo Creating Word version ...
pandoc metadata.yaml -s --resource-path="./src" -N --toc -V lang=de-de -o $filename.docx $chapters

# Create HTML Version (html)
echo Creating HTML version ...
pandoc metadata.yaml -s --resource-path="./src" -N --toc -V lang=de-de -o $filename.html $chapters

# Create PDF Version (pdf)
#echo Creating PDF version ...
#pandoc metadata.yaml -s --resource-path="./src" --template lernos -N --toc -V lang=de-de -o $filename.pdf $chapters

# Create eBook Versions (epub, mobi)
#echo Creating eBook versions ...
#magick -density 300 $filename.pdf[0] ebook-cover.jpg
#mogrify -size 2500x2500 -resize 2500x2500 ebook-cover.jpg
#mogrify -crop 1563x2500+102+0 ebook-cover.jpg
#pandoc metadata.yaml -s --resource-path="./src" --epub-cover-image=ebook-cover.jpg -N --toc -V lang=de-de -o $filename.epub $chapters
#ebook-convert $filename.epub $filename.mobi

# Create Slides (revealjs)
# echo Creating Presentation ...
# pandoc metadata.yaml --from markdown -s --resource-path="./src" -t revealjs -V theme=night -s ./slides/index.md -o ../docs/de-slides/index.html

# Remove Unnecessary Files
# rm mermaid-filter.err
# rm ebook-cover.jpg
