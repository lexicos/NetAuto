
interface GigabitEthernet0/0
 ip address 10.10.101.27 255.255.255.254
 description Link 13 to BEL01 port GigabitEthernet0/0
 ip ospf network point-to-point
 ip ospf 10 area 0
 duplex auto
 speed auto
 media-type rj45
 !

interface GigabitEthernet0/1
 ip address 10.10.101.46 255.255.255.254
 description Link 23 to BEL02 port GigabitEthernet0/0
 ip ospf network point-to-point
 ip ospf 10 area 0
 duplex auto
 speed auto
 media-type rj45
 !

interface GigabitEthernet0/2
 ip address 10.10.101.68 255.255.255.254
 description Link 34 to BHR01 port GigabitEthernet0/0/0/2
 ip ospf network point-to-point
 ip ospf 10 area 0
 duplex auto
 speed auto
 media-type rj45
 !

