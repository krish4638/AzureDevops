#!/bin/bash

if [ -z $1 ]
then
  DOWNLOAD_HOST=c3.acr.org/acr-c3
else
  DOWNLOAD_HOST=$1
fi

`curl -fL -g https://$DOWNLOAD_HOST/downloads/acrconnect-installer-cli-@release_version[linux-x64].zip -o acrconnect-installer-cli.zip --insecure`

unzip -q -o acrconnect-installer-cli.zip -d /usr/local/bin/acrconnect-installer-cli

rm acrconnect-installer-cli.zip

echo '#!/bin/sh

exec /usr/local/bin/acrconnect-installer-cli/AcrConnect.Installer.Cli [acrconnect-installer] $@' > /usr/local/bin/acrconnect-installer

chmod +x /usr/local/bin/acrconnect-installer

chmod 777 /usr/local/bin/acrconnect-installer-cli/.

chmod 764 /usr/local/bin/acrconnect-installer-cli/AcrConnect.Installer.Cli

echo "Start the installer by running 'sudo acrconnect-installer install' or run 'sudo acrconnect-installer --help' for other commands"
