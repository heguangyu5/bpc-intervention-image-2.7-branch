#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Intervention/Image
rsync -a                        \
      --exclude=".*"            \
      -f"- Intervention/"       \
      -f"+ */"                  \
      -f"- *"                   \
      ./                        \
      ./Intervention

echo "placeholder-image.php" > ./Intervention/src.list

for i in `cat $1`
do
    if [[ "$i" == \* ]]
    then
        echo $i
    else
        echo $i >> ./Intervention/src.list
        filename=`basename -- $i`
        if [ "${filename#*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Intervention/$i
        else
            echo "cp       $i"
            cp $i ./Intervention/$i
        fi
    fi
done
cp bpc.conf Makefile ./Intervention/
