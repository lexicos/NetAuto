Network Wide Allocations

The network will consist of the following network wide allocations.
All nodes loopback will be derived from the 10.10.100.0/24 subnet where the last octet is a unique node ID ranging from 0 to 255.
All internal WAN links will be derived from the following subnet 10.10.101.0/24 where each link is addressed using a /31 subnet mask and referenced via LinkID ranging from 0-127. 

All customer and service addressing will come from the 172.16.0.0/16 subnet and subdivided as required. All systems are managed via NMS systems in the East region.
These allocations are captured in the inventory/group_vars/all.yml file.

Groupings of nodes
The network is administered by two distinct teams managing an East and West region. Each region has its own DNS, SMNP and NMS systems as detailed below.
These allocations are captured in the inventory/group_vars/east.yml and west.yml files.

Host specific details
All nodes have been renamed from city names to 3-digit county codes plus a reference number from 00 to 99. This structure naming will assist with automation tasks. All nodes within the network are recorded in the inventory/hosts.yml file which details the region or group, FQDN, IP address and nodeid. 
Individual host_vars files are generated at playbook runtime using the following WanLinkToHostVars.yml playbook which uses the templates/WanLinkToVars.j2 to generate the files. The WAN links are recorded in the WanLink.yml file.

Customer service
