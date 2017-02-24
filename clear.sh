#! /bin/bash
allIndices=`curl http://192.168.100.224:8056/_cat/indices |awk '{print $3}'`
expDate=$(date -d "-8 days" +"%Y-%m-%d")
strExpDate=$expDate
echo "Expired date:" $strExpDate
for indice in ${allIndices}
do
if [[ $indice == *"-"* ]]; then
   #echo $indice
   #inDate=$(echo $indice | tr "-" "\n")
   #inDate=(${IN//-/ })
   inDate=${indice##*-}
   #echo $inDate
   ori='.'
   cur='-'
   chanDate="${inDate//$ori/$cur}"
   #echo $chanDate

   intDate=$(date -d $chanDate +%s)

   cond=$(date -d $expDate +%s)
   #echo $intDate
   #echo $cond


if [ $intDate -lt $cond ];
then
   #echo $intDate
   #echo $chanDate
   finalIndice="http://192.168.100.224:8056/"$indice
   echo "Deleting "$finalIndice"\n"
   curl -XDELETE $finalIndice
   echo "Delete successful!"
fi

fi
done
echo "Finished."
