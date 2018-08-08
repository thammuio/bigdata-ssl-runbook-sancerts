#What Do I DO

This runbook is to keystore, truststore, pem, ctr and other SSL Releated Files
#To Request SSL Certs for any host



#Runbook Contents
bigdata-ssl-runbook-sancerts
	ad-certs
	ad-nodes
	jks-files
	pfx-files
	README.md
	rootca-certs
	run-on-other.sh
	run.sh
	san-cn
	san-cn-old
	sanlog-0524.log
	scripts
	variables


#Where to place the files - Directories
#ad-certs
Copy all Active direcotry Domain controller certs into `ad-certs` direcory with namig convention as FQDN.cer
	- It should be in Base-64 encoded .CER(.cer)

#jks-files
These files will be generated from the scripts using .pfx files

#pfx-files
Place all .pfx files for all `san-cn`  with naming convention as SAN Certs

#rootca-certs
Place all Root and Subordinate CA certificate in this direcotry
	- with Naming convention as exactly below
		- `company.enterprise.ca.cer` for RootCA
		- `company.enterprise.inter.ca.cer` for subordinate RootCA
		- `company.enterprise.inter2.ca.cer` for second subordinate RootCA

#scripts
This contains all the scripts needed for the SSL

#sancnshortname.tar
This is the tar file that you will get after succusfull run, which you will use to copy into other nodes in SAN DNS



#Required variables and Scripts - Files
#ad-nodes
List of all Active direcotry Domain controller FQDN's

#cluster-nodes
List of FQDN's for all nodes in the Cluster

#run-on-other.sh
Run this on the other cluster once`run.sh` is succesful in createing `sancnshortname.tar` and `scp sancnshortname.tar` to all other nodes in the cluster - and then run this script on those nodes

#run.sh
Run this on the Master server to create `sancommonname.tar`

#variables
Modify it accordingly to fit to your cluster

#GENERATED
ls /bigdata/security/
clusterflow-prod-kafa-0001to0020  clusterlake-prod-hbsa-0051to0100  clusterlake-prod-wrka-0001to0050
clusterlake-prod-hbsa-0001to0050  clusterlake-prod-othr-0001to0010  clusterlake-prod-wrka-0101to0150

#DISTRIBUTE
for i in {01..50};do scp -r /bigdata/security/clusterlake-prod-hbsa-0001to0050 Server$i:;done

#Run below on all SAN Servers
sudo mkdir /bigdata/security; sudo cp -r clusterlake-prod-hbsa-0051to0100/tls /bigdata/security/;sudo chmod -R 755 /bigdata/security;ls -alh /bigdata/security/tls

sudo cp /usr/jdk64/latest/jre/lib/security/cacerts /usr/jdk64/latest/jre/lib/security/jssecacerts;sudo /usr/jdk64/latest/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriserootca -file /bigdata/security/tls/rootca/company.enterprise.ca.pem -keystore /usr/jdk64/latest/jre/lib/security/jssecacerts -storepass changeit;sudo /usr/jdk64/latest/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriseinterca -file /bigdata/security/tls/rootca/company.enterprise.inter.ca.pem -keystore /usr/jdk64/latest/jre/lib/security/jssecacerts -storepass changeit;sudo /usr/jdk64/latest/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriseinter2ca -file /bigdata/security/tls/rootca/company.enterprise.inter2.ca.pem -keystore /usr/jdk64/latest/jre/lib/security/jssecacerts -storepass changeit;sudo chmod 644 /usr/jdk64/latest/jre/lib/security/jssecacerts