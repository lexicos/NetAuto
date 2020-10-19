.PHONY : all 

#The line below must match the rule name.
all: Generate-HostVars.at Generated-Configurations.at Generated-Services.at

#The rule name must match the output file > below
Generate-HostVars.at : 			Generate-HostVars.yml \
								templates/Generate-HostVars.j2 \
								inventory/hosts.yml \
								WanLink.yml 
	ansible-playbook Generate-HostVars.yml -i inventory/hosts.yml
	>Generate-HostVars.at    #This must match the rule name above
	#Not sure why this cant be in a subdirectory

Generated-Configurations.at : 	Generate-Configurations.yml \
								templates/Generate-Configurations.j2 \
								inventory/hosts.yml \
								inventory/host_vars/* 
	ansible-playbook Generate-Configurations.yml -i inventory/hosts.yml
	>Generated-Configurations.at

Generated-Services.at : 		Generate-Services.yml \
								templates/Generate-Services.j2 \
								inventory/hosts.yml \
								services.yml 
	ansible-playbook Generate-Services.yml -i inventory/hosts.yml
	>Generated-Services.at

#This is only called with teh make clean command
clean :
	echo "Cleaning up..."
	rm configurations/*.*
	rm inventory/host_vars/*.*
	rm *.at