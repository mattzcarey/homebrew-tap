#!/bin/sh
# Points a formula at the latest GitHub release of its project.
# Usage: scripts/bump.sh <formula> <owner/repo>      e.g. scripts/bump.sh everystate mattzcarey/everystate
# Rewrites the version in each release URL, and the sha256 after it. Does nothing when the formula is current.
set -eu
formula="Formula/$1.rb"
repo="$2"
tag=$(gh api "repos/$repo/releases/latest" -q .tag_name)
new=${tag#v}
old=$(sed -n 's|.*/releases/download/v\([^/]*\)/.*|\1|p' "$formula" | head -1)
if [ "$old" = "$new" ]; then echo "$1 is already at $new"; exit 0; fi

tmp=$(mktemp)
sed "s|/releases/download/v$old/|/releases/download/v$new/|" "$formula" > "$tmp"
for url in $(sed -n 's/^ *url "\(.*\)"$/\1/p' "$tmp"); do
  sum=$(curl -fsSL "$url" | shasum -a 256 | cut -d' ' -f1)
  # The sha256 line follows its url line.
  awk -v url="$url" -v sum="$sum" '
    hit && /sha256/ { sub(/"[0-9a-f]*"/, "\"" sum "\""); hit = 0 }
    index($0, url) { hit = 1 }
    { print }' "$tmp" > "$tmp.next"
  mv "$tmp.next" "$tmp"
done
mv "$tmp" "$formula"
echo "$1: $old -> $new"
