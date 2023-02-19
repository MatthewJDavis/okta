mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

format:
	terraform fmt -recursive

test:
	terraform fmt -check -recursive
	terraform validate
	# terraform plan -out=tfplan
	# terraform show -json tfplan >> tfplan.json
