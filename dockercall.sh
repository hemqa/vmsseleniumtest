#! /bin/bash

ContainerName="$1"
FolderName="$2"
ContainerID=$(docker inspect --format {{.Id}} $ContainerName)

if [ -n "$ContainerID" ] ; then
    if [ -f  /var/lib/docker/image/aufs/layerdb/mounts/$ContainerID/mount-id ] ; then
       ConID=$(cat /var/lib/docker/image/aufs/layerdb/mounts/$ContainerID/mount-id)
       getmountID=/var/lib/docker/aufs/mnt/$ConID
    fi
    if [ ! -d "$getmountID" ] ; then
        getmountID=/var/lib/docker/aufs/diff/$ContainerID
    fi
fi

cp -R /var/lib/jenkins/workspace/$FolderName $getmountID/var/tmp/
docker exec -i $1 /bin/bash -c "sh /var/tmp/$FolderName/starttest.sh /var/tmp/$FolderName"
docker cp $ContainerName:/var/tmp/$FolderName/target /var/lib/jenkins/workspace/$FolderName/
chown -fR jenkins:jenkins /var/lib/jenkins/workspace/$FolderName/target