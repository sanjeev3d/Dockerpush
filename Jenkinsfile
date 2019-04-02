pipeline {
    agent {
        docker {
            image 'sanjeev3d/ubuntu-docker'
            args  '-v /var/run/docker.sock:/var/run/docker.sock'
            args  '-u root:sudo'
        }
    }
    stages {
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
