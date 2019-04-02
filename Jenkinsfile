pipeline {
    agent {
        docker {
            image 'sanjeev3d/ubuntu-docker'
            args  '-u root:sudo'
            
        }
    }
    stages {
        stage('Dockersetup') {
        steps {
            sh '''
                apt update
                apt install sudo -y
                sudo usermod -a -G docker root
                '''
              }
        }
        stage('build') {
            steps {
                script {
                def img = docker.build('sanjeev3d/nginx:latest', '.')
                }
            }
        }
        stage('publish') {
            steps {
                script {
                 docker.withRegistry('', 'test-id') {
                 img.push('latest')
                 }
                }
            }
        }
    }
}
