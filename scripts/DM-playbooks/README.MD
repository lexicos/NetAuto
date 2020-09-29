<H1>	Description infrastructure Data Model </H1>

<H2> Network Wide Allocations </H2>
The network will consist of the following network wide allocations.

All nodes loopback will be derived from the **10.10.100.0/24**  subnet where the last octet is a unique node ID ranging from 0 to 255.

All internal WAN links will be derived from the following subnet **10.10.101.0/24** where each link is addressed using a /31 subnet mask and referenced via LinkID ranging from 0-127. 

All customer and service addressing will come from the **172.16.0.0/16** subnet and subdivided as required. All systems are managed via NMS systems in the East region.
These allocations are captured in the <em>inventory/group_vars/all.yml</em> file.

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

These allocations are captured in the <em>inventory/group_vars/east.yml</em> and <em>..west.yml</em> files.

<h2>Host specific details</h2>
All nodes have been renamed from city names to 3-digit county codes plus a reference number from 00 to 99. This structure naming will assist with automation tasks. 

All nodes within the network are recorded in the <em>inventory/hosts.yml</em> file which details the region or group, FQDN, IP address and nodeid. 
Individual host_vars files are generated at playbook runtime using the following <em>WanLinkToHostVars.yml</em> playbook which uses the <em>templates/WanLinkToVars.j2</em> to generate the files. The WAN links are recorded in the WanLink.yml file.

<h2>Customer service</h2>
To be added

<h2>Playbook</h2>
The <em>fgGenerate.yml</em> playbook 
<li> Generates host_vars for east and west nodes using the <em>WanLinksToVars.j2</em> template</li>
<li> Generates per node configurations using the <em>IosCfg.j2</em> template.</li>
<l1>Resulting files are stored in the configurations directory.</l1>
