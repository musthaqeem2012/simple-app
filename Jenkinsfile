#!/usr/bin/env groovy
pipeline {
    environment {
    ENV_NAME = "${env.ENV_NAME}"
}

 parameters {
    string(defaultValue: "TEST", description: 'What environment?', name: 'userFlag')
    choice(choices: ['DEV', 'STAGING', 'PRODUCTION'], description: 'Select field for target environment', name: 'DEPLOY_ENV')
    }
    agent any

    stages {
        stage('Scm') {
            steps {
                echo 'Building..'
				
				
                sh 'mvn --version'
                 git 'https://github.com/musthaqeem2012/simple-app.git'

                 
            }
        }
       
		
	stage('Build') {
        
        steps {
		sh "mvn -Dmaven.test.failure.ignore=true clean package"
            script {
			
				if("${params.DEPLOY_ENV}"!="DEV"){
					def IS_APPROVED = input(
						message: "Approve release?",
						parameters: [
							string(name: 'IS_APPROVED', defaultValue: 'y', description: 'Deploy to master?')
						]
					)
					if (IS_APPROVED != 'y') {
						currentBuild.result = "ABORTED"
						error "User cancelled"
					}
				}
            }
        }
    }
	     stage('UnitTest') {
            steps {
                
                echo 'Unit Testig..'
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
stage('SonarQube analysis') {
	steps {
   withSonarQubeEnv('sonarqube') {
                 sh 'mvn clean package sonar:sonar'
              }
  } 
}
       
        stage('Artifact Upload') {
            steps {
                echo 'Deploying....'
                sh "mvn -Dmaven.test.failure.ignore=true clean package deploy -X"
                
                nexusArtifactUploader artifacts: [[artifactId: 'simple-app', classifier: '', file: 'target/simple-app-3.0.1-SNAPSHOT.war', type: 'war']], credentialsId: '266f833e-91af-4353-8e9e-4911c96f6658', groupId: 'in.javahome', nexusUrl: '3.135.207.159:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'SAMPLE-SNAP', version: '3.0.1-SNAPSHOT'
            }
        }
	    
        stage('Deploy to Dev') {
            steps {
                echo 'Deploying....'
                //sh "deploy.sh"
		    
                sh "pwd"
		    //sh "bash ./deploy.sh" 
                //sh "wget http://18.218.231.147:8081/repository/SAMPLE-SNAP/in/javahome/simple-app/3.0.1-SNAPSHOT/simple-app-3.0.1-20200426.091358-1.war"
		 sh "bash ./deploy.sh"  
		//  sh "bash ./sanity.sh http://3.23.59.104:8090/simple-app-3.0.1-SNAPSHOT"  
		    sh "bash ./sanity.sh"
		echo 'Deployed Successfully'
            }
        }	    
	    
    }
}

