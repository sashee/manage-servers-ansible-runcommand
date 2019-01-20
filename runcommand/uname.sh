command_id=$(aws ssm send-command --targets Key=tag:Group,Values=runcommand-test --document-name "AWS-RunShellScript" --comment "uname" --parameters commands=uname --output text --query "Command.CommandId")

while [ $(aws ssm list-commands --command-id "$command_id" | jq -r '.Commands[0].Status') != "Success" ] ; do sleep 1000; done

aws ssm list-command-invocations --command-id "$command_id" --details | jq '.CommandInvocations | map({InstanceId: .InstanceId, Output: .CommandPlugins[0].Output})'
