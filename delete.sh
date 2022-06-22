#! /bin/bash
default_region='us-east-1'

# choose a template based on the Stack Name
read  -p "Do you want to delete $1 ? (y/n) " answer
while true
do
  if [[ ${answer,,} = "n" ]]
  then
    echo "Deletion of $1 Aborted"
    exit 1
  elif [[ ${answer,,} = "y" ]]
  then
    echo "...trying to delete $1"
    echo " "
    break
  else 
    echo "please supply correct response"
    read  -p "sure to delete $1 (y/n) " answer
  fi

done

aws cloudformation delete-stack \
--stack-name ${1? 'Please Enter a Stack Name'} \
--region ${2-$default_region}