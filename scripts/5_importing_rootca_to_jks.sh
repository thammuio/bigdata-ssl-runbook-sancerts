#!/bin/bash
echo "Importing the company CA Certificate file into the java keystore .."
for i in `cat $sancn`; do
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriserootca \
-file $tlsdir/rootca/company.enterprise.ca.pem \
-keystore $tlsdir/keystore/$pfx_prefix$i.jks \
-storepass $strpass \
-keypass $strpass
done


echo "Importing the company CA Intermediate Certificate file into the java keystore .."
for i in `cat $sancn`; do
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseinterca \
-file $tlsdir/rootca/company.enterprise.inter.ca.pem \
-keystore $tlsdir/keystore/$pfx_prefix$i.jks \
-storepass $strpass \
-keypass $strpass
done

echo "Importing the company Intermediate2 CA Certificate file into the java keystore .."
for i in `cat $sancn`; do
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseinter2ca \
-file $tlsdir/rootca/company.enterprise.inter2.ca.pem \
-keystore $tlsdir/keystore/$pfx_prefix$i.jks \
-storepass $strpass \
-keypass $strpass
done

echo "done .."
