include makefile-app.mk
include make-ansible.mk
include make-production.mk


terraform-vars-generate:
	ansible-playbook ansible/terraform.yml -i ansible/production -vv
