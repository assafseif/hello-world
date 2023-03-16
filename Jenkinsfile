pipeline {
    agent { 
        node {
            label 'built-in'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.." 
            }
        }
        stage('Test') {
            steps {
                echo "Testing.." 
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....' 
            }
        }
    }
}
