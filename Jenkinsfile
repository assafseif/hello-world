pipeline {
    agent any
    
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