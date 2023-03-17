pipeline {
    agent any
<<<<<<< HEAD
    
      environment {
        imageName = "myphpapp"
        registryCredentials = "nexus"
        registry = "ec2-13-58-223-172.us-east-2.compute.amazonaws.com:8085/"
        dockerImage = ''
    }
    
    
	stages{
	        stage ('checkout'){
	            
	            steps{
	                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/assafseif/hello-world']])
	            }
	        }
	    
	    
	    stage('build Imae'){
	        steps {
	            script{
	                dockerImage=docker.build imageName
	            }
	        }
	        
	    }
	    
	    
	    
	    
	    
	}
}
=======
    tools {nodejs "nodejs"}
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
        stage('Test') { 
            steps {
              echo 'Testing ...' 
            }
        }
    }
}
>>>>>>> e719762ea868e0e5657aea6d618e8b114a8ecc81
