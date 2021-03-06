# The autonet
Behold this fictional network put together to support training and development of network automation technologies. Its pretty bare bones to start with. Each router has a default configuration with one management IP address connected via an out of band network to the NMS station which host Ansible. SSH is configured in order to support connection from automation tools.
 ![Topo](https://user-images.githubusercontent.com/17169238/65721114-56ac4e00-e0a1-11e9-94f7-63cb6f9258b7.JPG)
 
 ## Node Details (from generated reports see below)
 |Nodes|Uptime|Software|
|-----|------|--------|
|Bristol|5110543|15.7(3)M3|
|Bruges|5110988|15.7(3)M3|
|Antwerp|5111032|15.7(3)M3|
|Bahrain|5074484|6.1.3[Default]|
|Delhi|5024375|6.1.3[Default]|
|Singapore|5025125|6.1.3[Default]|

# Basic report generation (AKA easy wins) 
The report runs from an hosts.ini file but can also run from the hosts.yml file. It supports --extra-vars as follows.
ansible-playbook -i inventory/hosts.ini framework.yml --extra-vars
The final report can be viewed at https://github.com/lexicos/NetAuto/blob/master/scripts/results_files/uptime-version-j2.md.
## script interactions
![H2 Reports](https://user-images.githubusercontent.com/17169238/71890667-b99b8f80-313c-11ea-8cfa-6ef9c7919da6.jpg)
