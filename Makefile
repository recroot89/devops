include makefile-app.mk
include make-ansible.mk



terraform-vars-generate:
	docker run -it -v $(CURDIR):/app -w /app ansible ansible-playbook ansible/terraform.yml -i ansible/production -vv --vault-password-file=tmp/ansible-vault-password
