#!/usr/bin/bash

# get path string
path=$1

# check if argument is passed
if [ -z "$path" ]; then
	echo "Filepath should be passed as first argument"
    exit 1
fi


# check if python is installed
command -v python3 >/dev/null 2>&1 && echo "python 3 is installed" || echo "python is not installed" $$ exit 1


#parse the path string
DESCRIPTION="${path##*/}"
SERVICE_PATH=$(unset CDPATH && cd "$(dirname "$path")" && echo $PWD/$(basename "$path"))
EXTENSION="${path##*.}"
BASENAME="${DESCRIPTION%.*}"


## check if service is active
#IS_ACTIVE=$(sudo systemctl is-active $SERVICE_NAME)
#if [ "$IS_ACTIVE" == "active" ]; then
#    # restart the service
#    echo "Service is running"
#    echo "Restarting service"
#    sudo systemctl restart $SERVICE_NAME
#    echo "Service restarted"
#else


# create service file
    echo "Creating service file"
	echo "description:	$DESCRIPTION"
	echo "service_path:	$SERVICE_PATH"
	echo "extension:	$EXTENSION"
	echo "basename:		$BASENAME"
    sudo cat > /etc/systemd/system/$BASENAME.service << EOF
[Unit]
Description=$DESCRIPTION

[Service]
ExecStart=/usr/bin/python3 $SERVICE_PATH

[Install]
WantedBy=multi-user.target
EOF

# restart daemon, enable and start service
    echo "Reloading daemon and enabling service"
    sudo systemctl daemon-reload 
    sudo systemctl enable $BASENAME 
    sudo systemctl start $BASENAME
    echo "Service Started"
#fi

exit 0
