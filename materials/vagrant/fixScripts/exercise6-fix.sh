#!/bin/bash
#add fix to exercise6-fix here

sudo apt-get update > /dev/null
sudo apt-get install sshpass > /dev/null

host=$(hostname -f);

if [ "$host" = "server1" ]; then
        server="server2"
else
        server="server1"
fi


i=1;
for last in "$@"
do
    i=$((i + 1));
done

names=" ";
i=1;
total=$#;
files_num=$((total-1));
while [ $i -le $files_num ]
do
        sshpass -p vagrant scp $1 vagrant@$server:$last;
        names="${names} $1";
        i=$((i+1));
        shift 1;
done

arr=$(wc -c $names);

echo "$arr" | awk 'END{print}' | awk '{ print $1 }';
