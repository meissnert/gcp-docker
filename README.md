# gcp-docker
Docker Image for Globus Connect Personal Client

# Running GCP client on Synology NAS:

1) Install the Docker app on the Synology drive 

2) On the registry tab of the Docker app look for meissnert/gcp and download the image 

3) launch the image using the wizard and specify a container name, e.g. gcp 

4) go to the container, edit and set environmental variables ```USERID``` & ```USER``` to match one of the local users on the NAS

5) on the volume settings specify which folders to share with the container and seth the mount path to ```/home/<USER>/<FOLDERTOSHARE>```

6) go to terminal and run: ```adduser --disabled-password --gecos '' $USER &USERID```

7) `su $USER `

8) ```/opt/globusconnectpersonel/globusconnect -setup <key>```

9) ```opt/globusconnectpersonel/gobusconnect -start &```
