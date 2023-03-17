pipeline {
    agent any
    
      environment {
        imageName = "myphpapp"
        registryCredentials = "nexus"
        registry = "localhost:8085/"
        dockerImage = ''
    }
    
    
	stages{
	        stage ('checkout'){
	            
	            steps{
	                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/assafseif/hello-world']])
	            }
	        }
	    
	    
	    stage('build Image'){
	        steps {
	            script{
	                dockerImage=docker.build imageName
	            }
	        }
	        
	    }
	    
	    
	     // Uploading Docker images into Nexus Registry
    stage('Uploading to Nexus') {
     steps{  
         script {
             docker.withRegistry( 'http://'+registry, registryCredentials ) {
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
       steps{
         script {
                bat 'docker run -d -p 3000:3000 --rm --name myphpcontainer ' + registry + imageName
                
            }
         }
      }    
    
   
         
	    
	}

}
