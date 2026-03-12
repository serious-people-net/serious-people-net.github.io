#!/usr/bin/env bash

set -euo pipefail

CAMPAIGNS_DIR="src/content/campaigns"

if [[ ! -d "$CAMPAIGNS_DIR" ]]; then
  echo "Error: Campaign directory not found: $CAMPAIGNS_DIR"
  exit 1
fi

echo "Create a new campaign markdown file"
echo

read -r -p "Title: " title
while [[ -z "$title" ]]; do
  echo "Title cannot be empty."
  read -r -p "Title: " title
done

read -r -p "URL (must start with http:// or https://): " url
while [[ ! "$url" =~ ^https?:// ]]; do
  echo "Please enter a valid URL starting with http:// or https://"
  read -r -p "URL: " url
done

read -r -p "Published date (YYYY-MM-DD): " published_at
while [[ ! "$published_at" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; do
  echo "Please use YYYY-MM-DD format (example: 2026-03-12)."
  read -r -p "Published date (YYYY-MM-DD): " published_at
done

default_slug="$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"

read -r -p "Filename slug [$default_slug]: " slug
slug="${slug:-$default_slug}"

if [[ -z "$slug" ]]; then
  echo "Error: Could not generate a filename slug from title."
  exit 1
fi

target_file="$CAMPAIGNS_DIR/$slug.md"

if [[ -f "$target_file" ]]; then
  echo "Error: File already exists: $target_file"
  exit 1
fi

cat > "$target_file" <<EOF
---
title: "$title"
url: "$url"
description: ""
publishedAt: $published_at
featured: true
---
EOF

echo
echo "Created: $target_file"
