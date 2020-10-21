help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dev: ## Run against Dev Env
	@terraform init -backend-config=states/dev.tfvars
	@terraform apply -auto-approve -var-file=env/dev.tfvars

prod: ## Run against Prod Env
	@terraform init -backend-config=states/prod.tfvars
	@terraform apply -auto-approve -var-file=env/prod.tfvars
