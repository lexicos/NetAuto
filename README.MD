<H1> Branch Information </H1>
This branch achieves the same as the master branch does with Jinja 2 templates but using blockinfile and loops. 
Some drawbacks of the approach. 

The block in file sections get overwritten upon loop unless a unique marker is used. This means that only the results from the last run are included in the output. This can be remediate by using “” marker which puts all the output at the end of the file. In this branch I worked around it by adding a for loop to the jinja template to create as many block in file elements as needed by the data structure using loop.index. This was mirrored in the blockinfile using the Index_Var field. Not pretty!

The output includes the blockinfile markers with no simple way to remove them. It could be possible to write a J2 filter to remove them or a J2 python plugin. If they are this hard to remove maybe its not such a great idea. Will move on to assemble the code. 

The code does not look great embedded in the script and reduces the ability to reuse it. Maybe its possible to pull in the block from a snippet like the J2 macro’s did.

<H1> Infrastructure Data Model </H1>

![Topology](https://user-images.githubusercontent.com/17169238/95120967-46b05b00-0746-11eb-9cdd-753b4e936536.PNG)

<H2> Network Wide Allocations </H2>
The network will consist of the following network wide allocations.

All nodes **loopback** will be derived from the **10.10.100.0/24**  subnet where the last octet is a unique node ID ranging from 0 to 255.

All internal **WAN links** will be derived from the following subnet **10.10.101.0/24** where each link is addressed using a /31 subnet mask and referenced via LinkID ranging from 0-127. 

All customer and **service addressing** will come from the **172.16.0.0/16** subnet and subdivided as required. All systems are managed via NMS systems in the East region.
These allocations are captured in the **<em>inventory/group_vars/all.yml</em>** file.

<h2>Groupings of nodes</h2>
The network is administered by two distinct teams managing an East and West region. Each region has its own DNS, SMNP and NMS systems as detailed below.

|       | East        | West        |
|-------|-------------|-------------|
| DNS1  | 10.10.60.10 | 10.10.10.10 |
| DNS2  | 10.10.60.11 | 10.10.10.11 |
| SNMP1 | 10.10.60.12 | 10.10.10.12 |
| SNMP2 | 10.10.60.13 | 10.10.10.13 |
| NMS1  | 10.10.60.20 | 10.10.60.20 |
| NSM2  | -           | 10.10.60.21 |

These allocations are captured in the **<em>inventory/group_vars/east.yml</em>** and **<em>..west.yml</em>** files.

<h2>Host specific details</h2>
All nodes have been renamed from city names to 3-digit county codes plus a reference number from 00 to 99. This structure naming will assist with automation tasks. 

All nodes within the network are recorded in the **<em>inventory/hosts.yml</em>** file which details the region or group, FQDN, IP address and nodeid. 

Individual host_vars files are generated at playbook runtime using the following **<em>Generate-HostVars.yml</em>** playbook which uses the **<em>templates/Generate-HostVars.j2</em>** templateto generate the files. The WAN links are recorded in the WanLink.yml file.

<h2> Infrastructure Playbook</h2>

The **<em>Generate-Configurations.yml</em>** playbook 

<li> Generates host_vars for east and west nodes using the*<em>Generate-HostVars.j2</em> template</li>
<li> Generates per node configurations using the <em>Generate-Configurations.j2</em> template.</li>
<l1>Resulting files are stored in the configurations directory.</l1>

<H2> Infrasturcture Data model Diagram </H2>

![Infra-Data-Model](https://user-images.githubusercontent.com/17169238/95121518-0bfaf280-0747-11eb-85a8-dff94a1e81ba.PNG)

<h1>Customer GRE Tunnel service</h1>
This service is not optimal and better solutions exist to this problem but hey its just for practices. The service is a mesh of VPN tunnels between 3 of the nodes. The service configures the base elements such as VRF and routing instances for all nodes. Only 3 of the nodes however have customer access ports configured to align with the topology. 

The service uses the **172.16.1.0/24** subnet to host loopback addresses which are used for unnumbered tunnel addressing. 

The customer facing ports are host a /29 subnet within the **172.16.16.0/22** subnet range. The actual subnet is derived from the node ID of the service with the port being the first in the subnet.

<h2> Services Playbook</h2>

The **<em>Generate-services.yml</em>** playbook 

<li> Generates per node configurations using the <em>Generate-Services.j2</em> template.</li>
<l1> Resulting files are stored in the configurations directory.</l1>

<H2> Services Data model Diagram </H2>

![Services-Data-Model](https://user-images.githubusercontent.com/17169238/95121085-70698200-0746-11eb-8983-9a90f610eec9.PNG)

<H1> Pulling it together with a makefile </H1>

The following makefile brings together the 3 playbooks to create host vars followed by the device configuration and finally the service configuration. Each stage is only executed if the dependent files (Green \ delineated blocks below) have a modification date which is newer than the output file. The output file in this case acts as a simple timestamp file of when the stage was last run. 

![makefile](https://user-images.githubusercontent.com/17169238/96472509-77a18d00-1228-11eb-9a94-28354df524f4.PNG)

TODO Come back and work out how to register the output files from Ansible to the mikefile manifest. 
