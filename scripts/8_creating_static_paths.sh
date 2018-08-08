#!/bin/bash
sudo cp $tlsdir/x509/$sancommonname.pem $tlsdir/x509/cert.pem
sudo cp $tlsdir/x509/$sancommonname.key $tlsdir/x509/key.pem
sudo cp $tlsdir/x509/$sancommonname-keynopw.pem $tlsdir/x509/keynopw.pem
sudo cp $tlsdir/keystore/$sancommonname.jks $tlsdir/keystore/keystore.jks
sudo cp $tlsdir/x509/$sancommonname.crt $tlsdir/x509/cert.crt
sudo cp $tlsdir/x509/$sancommonname.cer $tlsdir/x509/cert.cer
sudo cp $tlsdir/x509/$sancommonname.key $tlsdir/x509/key.key
sudo cp $tlsdir/x509/$sancommonname-keynopw.key $tlsdir/x509/keynopw.key