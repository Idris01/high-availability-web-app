#! /bin/bash
default_region='us-east-1'

aws cloudformation describe-stacks \
--stack-name ${1? 'Please Enter a Stack Name'} \
--region ${2-$default_region}