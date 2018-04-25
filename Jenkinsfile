pipeline {
    agent any
    environment {
            SERVICE_NAME='ecs-cluster-dev-service'
            FAMILY='Common-Task-Definition'
    }
    parameters {
        string(defaultValue: "DEV", description: 'What environment?', name: 'environment')
        string(defaultValue: "develop-2", description: 'Build Tag', name: 'build_tag')
    }

    stages {
        stage("Environment Check") {
            steps {
                echo "flag: ${params.build_tag}"
                echo "flag: ${params.environment}"
            }
        }
        
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("Clean work space") {
            steps {
                sh "rm -rf 	common-task-definition-v*"
            }
        }
        stage("Update Task Definition") {
            steps {
                sh "eval `sed -e 's;%BUILD_NUMBER%;${params.build_tag};g' common-task-definition.json > common-task-definition-v_${params.build_tag}.json`"
                sh "eval `sed -i -e 's;%PROFILE%;${params.environment};g' common-task-definition-v_${params.build_tag}.json`"
            }
        } 
        stage("Register Task Definition") {
            steps {
                sh "aws ecs register-task-definition --region us-west-2 --family ${FAMILY} --cli-input-json file://common-task-definition-v_${params.build_tag}.json"
                //def TASK_REVISION = sh "aws ecs describe-task-definition --task-definition ${FAMILY}"
                def out = sh script: 'aws ecs describe-task-definition --task-definition ${FAMILY}', returnStdout: true
                //sh "eval `aws ecs update-service --cluster default --region us-west-2 --service ${SERVICE_NAME} --task-definition ${env.TASK_FAMILY}:${params.build_tag}`"
            }
        } 
    }
}
