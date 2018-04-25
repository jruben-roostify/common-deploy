

TASK_REVISION=`aws ecs describe-task-definition --task-definition $1 | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`
DESIRED_COUNT=`aws ecs describe-services --services $2 | egrep "desiredCount" | tr "/" " " | awk '{print $2}' | sed 's/,$//'`
echo $TASK_REVISION
echo $DESIRED_COUNT