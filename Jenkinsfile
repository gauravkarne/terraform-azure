@Library('github.com/releaseworks/jenkinslib') _
node{
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'azure-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        stage 'Checkout Terraform Project'
            git branch: 'main', url: 'https://github.com/gauravkarne/terraform-azure.git'
        stage 'Set up azure Env'
            bat 'az login -u "terraformDec12@ACP3837A.onmicrosoft.com" -p "Acc1234$$"'
        stage 'Set azure account'
            bat 'az account set --subscription=b473335b-e612-444d-a496-6ce2680a7f69'
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
