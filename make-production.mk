production-deploy-app:
	ansible-playbook ansible/deploy.yml -i ansible/production --tags app -u ubuntu -vv
