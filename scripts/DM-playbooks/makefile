all: Generate-HostVars Generate-Configurations Generate-Services

Generate-HostVars:
	ansible-playbook /etc/ansible/NetAuto/scripts/DM-playbooks/Generate-HostVars.yml -i /etc/ansible/NetAuto/scripts/DM-playbooks/inventory/hosts.yml

Generate-Configurations:
	ansible-playbook /etc/ansible/NetAuto/scripts/DM-playbooks/Generate-Configurations.yml -i /etc/ansible/NetAuto/scripts/DM-playbooks/inventory/hosts.yml

Generate-Services:
	ansible-playbook /etc/ansible/NetAuto/scripts/DM-playbooks/Generate-Services.yml -i /etc/ansible/NetAuto/scripts/DM-playbooks/inventory/hosts.yml

clean:
	echo "Cleaning up..."
	rm configurations/*.*
	rm inventory/host_vars/*.*


