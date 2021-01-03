#!/bin/bash

rm -f leetcode_mdanki.apkg
mkdir -p temp
ls **/lc_*.md | xargs -I file cp file temp/
echo "generating leetcode_mdanki.apkg ..."
mdanki temp leetcode_mdanki.apkg
rm -r temp
