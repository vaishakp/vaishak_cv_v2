#!/usr/bin/env bash
# Build all three CV versions and check their page counts.
#
# This replaces the GitHub Actions workflow, which had to be removed: Overleaf's
# GitHub integration does not request the `workflow` OAuth scope, so GitHub
# refuses any sync that touches .github/workflows/ and the whole sync fails.
# Keeping that directory out of the repository is what makes Overleaf sync work.
#
# Usage:  ./build.sh
set -euo pipefail

cd "$(dirname "$0")"

status=0

for doc in main cv-3page cv-1page; do
    if latexmk -pdf -interaction=nonstopmode -halt-on-error "$doc.tex" > "/tmp/cvbuild-$doc.log" 2>&1; then
        pages=$(pdfinfo "$doc.pdf" | awk '/^Pages:/ {print $2}')
        printf '  ok    %-10s %s pages\n' "$doc" "$pages"
    else
        printf '  FAIL  %-10s see /tmp/cvbuild-%s.log\n' "$doc" "$doc"
        status=1
        continue
    fi

    case "$doc" in
        cv-1page)
            [ "$pages" -eq 1 ] || { printf '        ERROR: cv-1page must be exactly 1 page\n'; status=1; } ;;
        cv-3page)
            [ "$pages" -le 3 ] || { printf '        ERROR: cv-3page must be at most 3 pages\n'; status=1; } ;;
    esac
done

latexmk -c > /dev/null 2>&1 || true

if [ "$status" -eq 0 ]; then
    echo "All three versions built and within their page limits."
else
    echo "Build finished with problems." >&2
fi
exit "$status"
