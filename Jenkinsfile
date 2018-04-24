pipeline {
    agent any

    parameters {
        booleanParam(defaultValue: true, description: 'test input', name: 'userFlag')
    }

    stages {
        stage("foo") {
            steps {
                echo "flag: ${params.userFlag}"
            }
        }
    }
}
