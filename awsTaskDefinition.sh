

TASK_REVISION=`aws ecs describe-task-definition --task-definition $1 --region $3 | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`
#DESIRED_COUNT=`aws ecs describe-services --services $2 --region $3 | egrep "desiredCount" | tr "/" " " | awk '{print $2}' | sed 's/,$//'`
echo $TASK_REVISION
#echo $DESIRED_COUNT

aws ecs update-service --cluster default --service $2 --task-definition $2:${TASK_REVISION} --desired-count 1
