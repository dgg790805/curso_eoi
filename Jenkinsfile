pipeline {
    agent any

    environment {
	registry="dgg790805/act3-jenkins"
        registryCredentials="Dockerhub"
	project="act3-jenkins"
        projectVersion="1.0"
	repository="https://github.com/dgg790805/curso_eoi.git"
	repositoryCredentials="Github"
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
		script{
			git branch: 'main',
			credentialsId: repositoryCredentials,
			url: repository
		}
            }
        }

        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    try {
                        sh 'docker run --name $project $registry'
                    } finally {
			sh 'docker rm $project'	
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('', registryCredentials) {
                        dockerImage.push()
                    }
                }
            }
        }

	stage('Cleaning up') {
		steps {
			script {
				sh 'docker rmi $registry'
			}
		}
	}
    }

    post {
        failure {
            echo "El pipeline ha fallado."
        }
    }
}

