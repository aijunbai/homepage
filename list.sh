#!/bin/bash

ROOT=$1
OUTPUT=`mktemp`

cd $ROOT
rm -f $OUTPUT
touch $OUTPUT

echo "<p>This is a list of files in this directory.</p>" >> $OUTPUT

filepath="."
path=`basename "$filepath"`
echo "  <h2>$path</h2>" >> $OUTPUT
echo "  <ul>" >> $OUTPUT
for i in `find "$filepath" -maxdepth 1 -mindepth 1 -type f | sort`; do
file=`basename "$i"`
echo "    <li><a href=\"$filepath/$file\">$file</a></li>" >> $OUTPUT
done
echo "  </ul>" >> $OUTPUT
echo "  <br />" >> $OUTPUT
echo "  <br />" >> $OUTPUT

cat ../header.html $OUTPUT ../footer.html > index.html
rm -f $OUTPUT
