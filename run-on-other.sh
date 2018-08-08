#!/bin/bash

#Copy the below from variables file
sancommonname=san-common-name
javahome=/usr/jdk64/latest
tlsdir=/bigdata/security/tls/

#run this only after copying the sancommonname.tar file
echo "Copy all $sancommonname.tar file that was prepared"
tar -vxf $sancommonname.tar

sudo cp -r bigdata/security /bigdata/

echo "Creating a privileged store starting with the one included in the JDK"
sudo cp $javahome/jre/lib/security/cacerts $javahome/jre/lib/security/jssecacerts

echo "Importing OUR companyCA file into the CA truststore"
sudo $javahome/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriserootca -file $tlsdir/rootca/company.enterprise.ca.pem -keystore $javahome/jre/lib/security/jssecacerts -storepass changeit

sudo $javahome/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriseinterca -file $tlsdir/rootca/company.enterprise.inter.ca.pem -keystore $javahome/jre/lib/security/jssecacerts -storepass changeit

sudo $javahome/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriseinter2ca -file $tlsdir/rootca/company.enterprise.inter2.ca.pem -keystore $javahome/jre/lib/security/jssecacerts -storepass changeit