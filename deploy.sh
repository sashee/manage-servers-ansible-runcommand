aws cloudformation deploy --template-file cloudformation.yml --stack-name $2 --capabilities CAPABILITY_IAM --parameter-overrides KeyName=$1
