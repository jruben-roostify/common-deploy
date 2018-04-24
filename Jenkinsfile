pipeline {
    agent any

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
                sh "sed -e 's;%BUILD_NUMBER%;${params.build_tag};g' common-task-definition.json > common-task-definition-v_${params.build_tag}.json"
                sh "sed -e 's;%PROFILE%;${params.environment};g' common-task-definition-v_${params.build_tag}.json > common-task-definition-v_${params.build_tag}.json"
            }
        }        
    }
}
