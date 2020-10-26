
ip access-list standard NMS-STATIONS
 permit 10.10.60.20
 permit 10.10.60.21
!
snmp-server community public RO NMS-STATIONS
snmp-server community private RW NMS-STATIONS
snmp-server chassis-id 
snmp-server host 10.10.60.12 version 2c public 
snmp-server host 10.10.60.13 version 2c public 

