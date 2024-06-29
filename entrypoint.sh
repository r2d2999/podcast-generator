#!/bin/bash
set -e

echo "===================="
echo "Configurando Git"
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

echo "Ejecutando feed.py"
python3 /usr/bin/feed.py

echo "Añadiendo cambios y haciendo commit"
git add -A
git commit -m "updated feed"
git push --set-upstream origin main

echo "===================="
