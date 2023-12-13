@Library('github.com/releaseworks/jenkinslib') _
node{
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'azure-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        stage 'Checkout Terraform Project'
            git branch: 'main', url: 'https://gitlab.com/n.neeharikareddy/terraformrepo.git'
        stage 'INIT'
            bat 'terraform init'
        stage 'SANITY CHECK'
            bat 'terraform validate'
        stage 'PLAN'
            bat 'terraform plan -out "strg3.tfplan"'
        stage 'FORMAT'
            bat 'terraform fmt'
        stage 'APPLY'
            bat 'terraform apply "strg3.tfplan"'
        stage("List azure storage account") 
            bat 'terraform state list'
  }    
}
