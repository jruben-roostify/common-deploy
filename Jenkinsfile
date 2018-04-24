pipeline {
    agent any

    parameters {
        booleanParam(defaultValue: true, description: 'test input', name: 'userFlag')
        string(defaultValue: "TEST", description: 'What environment?', name: 'envirmoment')
        // choices are newline separated
        choice(choices: 'US-EAST-1\nUS-WEST-2', description: 'What AWS region?', name: 'region')
    }

    stages {
        stage("foo") {
            steps {
                echo "flag: ${params.userFlag}"
                echo "flag: ${params.envirmoment}"
                echo "flag: ${params.region}"
            }
        }
    }
}
