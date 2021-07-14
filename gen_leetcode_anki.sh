#!/bin/zsh

rm -f leetcode_mdanki.apkg
mkdir -p temp
ls **/*.md | xargs -I file cp file temp/
rm -f temp/README.md
echo "generating leetcode_mdanki.apkg ..."
mdanki temp leetcode_mdanki.apkg
rm -r temp

