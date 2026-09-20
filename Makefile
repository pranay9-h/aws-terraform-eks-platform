.PHONY: fmt validate-dev validate-prod

fmt:
	terraform fmt -recursive

validate-dev:
	terraform -chdir=environments/dev init -backend=false
	terraform -chdir=environments/dev validate

validate-prod:
	terraform -chdir=environments/prod init -backend=false
	terraform -chdir=environments/prod validate
