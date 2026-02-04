pipeline {
    agent {
        node {
            label 'robomart'
        }
    }
    environment {
        Account_id = "522534289017"
        appVersion = ""
        Project = "robomart"
        Component = "catalogue"

    }
    options{
        timeout(time: 120, unit: 'SECONDS')
        disableConcurrentBuilds()
    }
    stages {
        stage ('Read Version') {
            steps {
                script {
                    def pkg = readJSON file: 'package.json'
                    appVersion = pkg.version
                    echo "app version is : ${appVersion}"
                    echo "App Name    : ${pkg.name}"

                }
            }
        }

        stage ('Install dependencies') {
            steps {
                script {
                    sh  """
                      npm install
                """
                }
            }
        }
        stage ('Build Docker image') {
            steps {
                script {
                    withAWS(region:'us-east-1',credentials:'aws-cred') {
                        sh """
                            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${Account_id}.dkr.ecr.us-east-1.amazonaws.com
                            docker build -t ${Account_id}.dkr.ecr.us-east-1.amazonaws.com/${Project}/${Component}:${appVersion} .
                            docker images
                            docker push ${Account_id}.dkr.ecr.us-east-1.amazonaws.com/${Project}/${Component}:${appVersion}


                        """    
                    }
                }
            }
        }
        stage ('Testing') {
            steps {
                script {
                    sh  """
                    echo "Testing is Success"
                    sleep 2
                """
                }
            }
        }

        stage ('Deploying') {
            steps {
                script {
                    sh  """
                    echo "Deploying is Success"
                    sleep 1
                """
                }
            }
        }
    }
    post {
        always {
            echo "Post Message after stages"
            cleanWs()
        }
        success {
            echo "Build is success"
        }
        failure {
            echo "Build is failure"
        }
    }
    
}