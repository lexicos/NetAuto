
router ospf 10
 router-id 172.16.1.40
 default-metric 1000
 area 0
  loopback stub-network enable
  interface Loopback 0
 !

