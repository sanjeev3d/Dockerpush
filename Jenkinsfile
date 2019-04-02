pipeline {
    agent {
        docker {
            image 'sanjeev3d/docker:latest'
            args  '-v /var/run/docker.sock:/var/run/docker.sock'
            args  '-u root:sudo'
        }
    }
    stages {
        stage('Dockersetup') {
        steps {
            sh '''
                apt update
                apt install sudo -y
                sudo usermod -aG docker root
                sudo service docker start
                sudo service docker status
                chmod 775 /var/run/docker.sock
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
