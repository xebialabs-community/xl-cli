count=0
echo "Waiting for server to start..."
while true
do
  if [ $count -le 25 ]; then

    wget --spider -q http://xld:4516
    if [ $? -ne 0 ] ;then
      echo "waiting $count"
      sleep 4
      count=$(( count+1 ))
    else
      sleep 4
      echo "Website is up"
      for filename in /data/*.py; do
          /opt/xld/cli/bin/cli.sh -username admin -password admin -f $filename -host xld
          res=$?
          if [ $res != 0 ] ; then
            exit $res
          fi
      done
      sleep 4
      exit
    fi
  else
    echo "Timeout exceeded...giving up waiting for website"
    exit 1
  fi
done