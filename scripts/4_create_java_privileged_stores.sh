#!/bin/bash 
echo "Creating a privileged store starting with the one included in the JDK"
sudo cp $javahome/jre/lib/security/cacerts $javahome/jre/lib/security/jssecacerts

echo "Importing OUR companyCA file into the CA truststore"
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriserootca \
-file $tlsdir/rootca/company.enterprise.ca.pem \
-keystore $javahome/jre/lib/security/jssecacerts \
-storepass changeit

echo "Importing OUR companyCA Intermediate file into the CA truststore"
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseinterca \
-file $tlsdir/rootca/company.enterprise.inter.ca.pem \
-keystore $javahome/jre/lib/security/jssecacerts \
-storepass changeit

echo "Importing OUR companyCA Intermediate2 file into the CA truststore"
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseinter2ca \
-file $tlsdir/rootca/company.enterprise.inter2.ca.pem \
-keystore $javahome/jre/lib/security/jssecacerts \
-storepass changeit

for i in `cat $adnodes`;
do
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias $i \
-file $tlsdir/ad-certs/$i.pem \
-keystore $javahome/jre/lib/security/jssecacerts \
-storepass changeit
done


# for i in `cat $sancn`;
# do
# sudo $javahome/bin/keytool \
# -noprompt \
# -importcert \
# -trustcacerts \
# -alias $i \
# -file $tlsdir/x509/$i.pem \
# -keystore $javahome/jre/lib/security/jssecacerts \
# -storepass changeit
# done