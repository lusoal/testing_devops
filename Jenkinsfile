node {

    APP_PATH = "/opt/docker-project/testing_devops"
    BUCKET_NAME = "nginx-deplyo-testing"

    parameters {

        choice(name: 'FULL_DEPLOY', choices: ['TRUE', 'FALSE'], description: 'Choice for full deploy')

    }

    println "${params.FULL_DEPLOY}"

    if (params.FULL_DEPLOY == "TRUE"){
        stage ('Clonning Repository'){
            //Clonning repo from git hub
            sh 'cd /opt/docker-project && git clone https://github.com/lusoal/testing_devops.git && cd /opt/docker-project/testing_devops'
        }
    }else{
        stage ('Pulling repository'){
            sh 'cd /opt/docker-project/testing_devops && git pull'
        }
    }

    stage ('Download Content from s3'){
        sh 'cd ' + APP_PATH + ' && aws s3 sync s3://'+ BUCKET_NAME +' .'
    }

    stage ('Build Dockefile with most recent Build Number'){
        sh 'cd '+ APP_PATH +' && sudo docker build -t lusoal/nginx-test:'+BUILD_NUMBER+' .'

        sh 'sudo docker push lusoal/nginx-test:'+BUILD_NUMBER
    }
}