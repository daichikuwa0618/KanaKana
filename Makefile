PROJECT_DIR := ./

.PHONY: bootstrap
bootstrap:
	@$(MAKE) mint-bootstrap
	@$(MAKE) pod-install

.PHONY: open
open:
	xed $(PROJECT_DIR)

.PHONY: lint
lint:
	@if !(type "mint" > /dev/null 2>&1); then \
		echo "Mint not installed."; \
		exit 1; \
	fi
	mint run swiftlint --quiet


.PHONY: mint-bootstrap
mint-bootstrap:
	@if !(type "mint" > /dev/null 2>&1); then \
		echo "Mint not installed."; \
		exit 1; \
	fi
	mint bootstrap


.PHONY: pod-install
pod-install:
	@if !(type "bundle" > /dev/null 2>&1); then \
		echo "Bundler not installed."; \
		exit 1; \
	fi
	bundle install
	bundle exec pod install --repo-update

