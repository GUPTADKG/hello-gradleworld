pipeline 
{
        agent any
        tools{
			gradle 'G5'
		}
		
        stages 
		{
		  
                stage("Build") {
							
                        steps {
								
                                echo 'Build Web app Java with Gradle'
                               
								sh 'cd /var/jenkins_home/jobs/${JOB_NAME##*/}/workspace/'
	
								sh 'gradle build'
                                sh 'gradle run'						
								
                                
			}
                	}
					
				
				stage('PreDockerImageDependency') {
                        steps {
                                echo 'Copy Required files for Docker Image Creation'
                                sh 'cd /var/jenkins_home/jobs/${JOB_NAME##*/}/workspace/'
                                sh 'mkdir -p docker-build'
                                sh 'chmod 755 -R docker-build/'
                                sh 'chown jenkins:jenkins docker-build'
                                sh 'cp /var/jenkins_home/jobs/${JOB_NAME##*/}/workspace/build/libs/jb-hello-world-0.1.0.jar docker-build/'
                            
                        }
                }
         
               stage('DockerImage') {
                        steps {
                                echo 'Docker image creation...'
                                sh 'cd /var/jenkins_home/jobs/${JOB_NAME##*/}/workspace/'
								sh 'docker build -t hello-worldgradle .'
								}
				}
				stage('DockerImageRun1') {
                        steps {
								sh 'docker run -d -p 8085:8080 hello-worldgradle:latest'
							}

                }
				
				
				
		}
	post {
					always{
								
								junit 'target/surefire-reports/*.xml'

							}
					}
					
					
}
