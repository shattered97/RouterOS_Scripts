
#The simplest way to make sure you have absolutely clean router is to run
/system reset-configuration no-defaults=yes skip-backup=yes

#Set bridge and IP address
/interface bridge add name=local
/interface bridge port add interface=ether2 bridge=local
/ip address add address=192.168.2.1/24 interface=local

#Run DHCP Server Wizard
/ip dhcp-server setup

#DHCP client on the public interface
/ip dhcp-client add disabled=no interface=ether1

#Setup Password
/password

#By default mac server runs on all interfaces, so we will disable default all entry and add a local interface to disallow MAC connectivity from the WAN port
/tool mac-server
  disable 0;
  add interface=local;
  
 #MikroTik Neighbor discovery protocol is used to show and recognize other MikroTik routers in the network, disable neighbor discovery on public interfaces: 
/ip neighbor discovery-settings set discover-interface-list=local 

