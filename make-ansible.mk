ansible-vaults-encrypt:
	ansible-vault encrypt ansible/production/group_vars/all/vault.yml

ansible-vaults-decrypt:
	ansible-vault decrypt ansible/production/group_vars/all/vault.yml

ansible-vaults-edit:
	ansible-vault edit ansible/production/group_vars/all/vault.yml --vault-password-file=tmp/vault_password

development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv

terraform-vars-generate:
	ansible-playbook ansible/terraform.yml -i ansible/production -vv
