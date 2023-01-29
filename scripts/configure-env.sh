#!/bin/sh -e

# Instala dependências
poetry install

# Configura Visual Studio Code
if [ ! -e .vscode/settings.json ]; then
  cp .vscode/settings.json.example .vscode/settings.json
fi
jq \
  --arg ruff_path "$(poetry run which ruff)" \
  --arg mypy_path "$(poetry run which mypy)" \
  '.["ruff.path"] |= [$ruff_path] | .["python.linting.mypyPath"] |= $mypy_path' \
  .vscode/settings.json \
  > .vscode/settings.json.new
mv .vscode/settings.json.new .vscode/settings.json
