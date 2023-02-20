mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

format:
	terraform fmt -recursive

test:
	terraform fmt -check -recursive
	terraform validate

test-policy:
	rm -f tfplan
	rm -f tfplan.json
	terraform plan -out=tfplan
	terraform show -json tfplan >> tfplan.json
	pwsh -command 'Invoke-Pester -Path AuthenticationPolicy.Tests.ps1'