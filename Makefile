WS_PREFIX ?= $(HOME)/ws
VERSION:=$(shell semtag final -s minor -o)

#:help: help        | Displays the GNU makefile help
.PHONY: help
help: ; @sed -n 's/^#:help://p' Makefile

#:help: precommit   | Lint the project files using pre-commit
.PHONY: precommit
precommit:
	@pre-commit run --all-files

#:help: changever   | Change the product version to the next consecutive version number.
.PHONY: changever
changever:
	@find bin -type f -name ws-get -exec sed -i "" "s/VERSION=.*/VERSION=\"$(VERSION)\"/g" {} \;
	@git add bin/ws-get && git commit -m "Updated VERSION"

#:help: changelog   | Build the changelog
.PHONY: changelog
changelog:
	@git-chglog -o CHANGELOG.md --next-tag $(VERSION)
	@git add CHANGELOG.md && git commit -m "Updated CHANGELOG"
	@git push

#:help: release     | Release the product, setting the tag and pushing.
.PHONY: release
release:
	@semtag final -s minor
	@git push --follow-tags

#:help: install     | Installs the product, leaving the workspaces behind.
.PHONY: install
install: bin/ws-get
	@bin/ws-get install

#:help: update      | Updates the product, leaving the workspaces behind.
.PHONY: update
update: bin/ws-get
	@bin/ws-get update

#:help: uninstall   | Uninstalls the product, leaving the workspaces behind.
.PHONY: uninstall
uninstall:
	@bin/ws-get remove
