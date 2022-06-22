#! /bin/bash
default_template='final-project-starter.yaml'
default_parameter='server-parameters.json'
default_region='us-east-1'

# choose a template based on the Stack Name
if [[ ${1,,} =~ 'network' ]]
then
  default_template='network.yaml'
  default_parameter='network-parameters.json'
fi
#echo $default_template

echo "Creating $1 Stack..."
aws cloudformation create-stack \
--stack-name ${1? 'Please Enter a Stack Name'} \
--template-body file://${2-$default_template} \
--parameter file://${3-$default_parameter} \
--region ${4-$default_region}
output=$?;if (( $output != 0 ));then echo ""; echo 'Unable to Create Stack' ; else echo "$1 Stack Created Successfully"; fi