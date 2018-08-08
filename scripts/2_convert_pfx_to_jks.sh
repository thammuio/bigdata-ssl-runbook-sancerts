#!/bin/bash
echo "Converting .pfx to .jks..."

rm -f jks-files/*

sudo $javahome/bin/keytool \
-noprompt \
-importkeystore \
-srckeystore pfx-files/$pfx_prefix$i.pfx \
-srcalias $sancommonname \
-destalias $sancommonname \
-srcstorepass $strpass \
-srcstoretype pkcs12 \
-destkeystore jks-files/$pfx_prefix$i.jks \
-deststoretype JKS \
-storepass $strpass

echo "Done"

#-deststoretype pkcs12
# Warning: The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard