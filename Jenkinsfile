pipeline {
  // エージェントを指定
  agent {
    label 'infra-ops'
  }

  options {
    // デフォルトのチェックアウトをスキップ
    skipDefaultCheckout(true)
  }

  stages {
    // ワークスペースをクリアするステージ
    stage("clean workspace") {
      steps {
        // ワークスペースをクリアするステップ
        cleanWs()
      }
    }
    // git pullステージ
    stage("git pull") {
      steps {
        // git pullを行うステップ
        dir("/root/cloud") {
          sh "git pull"
        }
      }
    }
    // Terraformの初期化ステージ
    stage("terraform init") {
      steps {
        // Terraformの初期化を行うステップ
        dir("/root/cloud") {
          sh "terraform init -no-color"
        }
      }
    }
    // Terraformのプラン作成ステージ
    stage("terraform plan") {
      steps {
        // プランを作成するステップ
        dir("/root/cloud") {
          sh "terraform plan -no-color -var-file ./proxmox.tfvars -out plan.out"
        }
      }
    }
    // Terraformの適用ステージ
    stage("terraform apply") {
      steps {
        // Terraformの適用を行うステップ
        dir("/root/cloud") {
          sh "terraform apply -no-color -auto-approve plan.out"
        }
      }
    }
  }
}
