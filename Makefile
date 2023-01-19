# Project

srcdir = project manage.py


.PHONY: runserver
runserver:
	poetry run python manage.py runserver


# Build

.PHONY: build
build:
	poetry build


# Formatter

.PHONY: fmt fmt-ruff
fmt: fmt-ruff

fmt-ruff:
	poetry run ruff --fix-only $(srcdir)


# Lint

.PHONY: lint lint-poetry lint-ruff lint-mypy lint-django
lint: lint-poetry lint-ruff lint-mypy lint-django

lint-poetry:
	poetry check

lint-ruff:
	poetry run ruff $(srcdir)

lint-mypy:
	poetry run mypy $(srcdir)

lint-django:
	poetry run python manage.py check


# Clean

.PHONY: clean clean-src clean-data
clean: clean-src

clean-src:
	find $(srcdir) -name '__pycache__' -exec rm -rf {} +
	find $(srcdir) -type d -empty -delete
	rm -rf dist .ruff_cache .mypy_cache

clean-data:
	rm -rf db.sqlite3
