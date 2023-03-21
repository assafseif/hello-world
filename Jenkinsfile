pipeline {
    agent any
    
    environment {
        imageName = "myphpapp"
        registryCredentials = "nexus"
        registry = "localhost:8085/"
        dockerImage = ''
    }
    
    stages {
        stage ('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/assafseif/hello-world']])
            }
        }
          stage('SonarQube Analysis') {
            steps {
                // Use the SonarQube scanner step with the defined tool
                withSonarQubeEnv('SonarQube') {
                    bat 'C:/Users/assafseif/.jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/SonarQube/bin/sonar-scanner -D"sonar.projectKey=demo-appproject" -D"sonar.sources=." -D"sonar.host.url=http://localhost:9000" -D"sonar.login=sqp_4e9ddf7b33da859f6872b7f3120177a3e6e9fd56"'
                }
            }
        }
        
        stage('build Image') {
            steps {
                script {
                    dockerImage = docker.build imageName
                }
            }
        }
        
        // Uploading Docker images into Nexus Registry
        stage('Uploading to Nexus') {
            steps {  
                script {
                    docker.withRegistry('http://' + registry, registryCredentials) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
        
        stage('stop previous containers') {
            steps {
                bat 'docker rm -f myphpcontainer'
            }
        }
        
        stage('Docker Run') {
            steps {
                script {
                    bat 'docker run -d -p 3000:3000 --rm --name myphpcontainer ' + registry + imageName
                }
            }
        }
    }
    
    post {
        success {
            emailext body: "Build succeeded. Check the console output at ${env.BUILD_URL} for details.",
                     recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                     subject: "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - Success",
                     to: 'assaf_seif@outlook.com'
        }
        failure {
            emailext body: "Build failed. Check the console output at ${env.BUILD_URL} for details.",
                     recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                     subject: "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - Failure",
                     to: 'assaf_seif@outlook.com'
        }
    }
}
