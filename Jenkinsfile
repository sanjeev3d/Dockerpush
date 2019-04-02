pipeline {
    agent {
        docker {
            image 'sanjeev3d/ubuntu-docker'
            args  '-u root:sudo'
            args  '-v /var/run/docker.sock:/var/run/docker.sock'
            
        }
    }
    stages {
        stage('Dockersetup') {
        steps {
            sh '''
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
