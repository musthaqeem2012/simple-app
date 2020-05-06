#!/usr/bin/env groovy
pipeline {
    
    agent any

    stages {
          

        stage('Deploy to Dev') {
		when {
		branch 'Deployment'
		}
            steps {
		     
                echo 'Deploying....'
             	    
                sh "pwd"
		
                //sh "wget http://18.218.231.147:8081/repository/SAMPLE-SNAP/in/javahome/simple-app/3.0.1-SNAPSHOT/simple-app-3.0.1-20200426.091358-1.war"
		 sh "bash ./deploy.sh"  
		//  sh "bash ./sanity.sh http://3.23.59.104:8090/simple-app-3.0.1-SNAPSHOT"  
		
		echo 'Deployed Successfully'
           
	    }
        }	    
	    
	    
    }
}

