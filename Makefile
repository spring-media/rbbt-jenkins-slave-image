.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: validate build

.PHONY: build
build: ## builds AMI based on the template 'slave.json'
	@echo "+ $@"
	@read -p "Changes made: " changes \
		&& packer build -var-file variables.json -var "changes=$$changes" slave.json

.PHONY: validate
validate: ## validates the packer template
	@echo "+ $@"
	@packer validate -var-file variables.json slave.json

.PHONY: clean
clean: ## deletes manifest.json
	-rm -rf manifest.json