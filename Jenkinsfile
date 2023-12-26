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
          sh "terraform plan -no-color -out=plan.out"
        }
        // プランを適用するか確認するインプット
        input message: "Apply Plan?", ok: "Apply"
      }
    }
    // Terraformの適用ステージ
    stage("terraform apply") {
      steps {
        // Terraformの適用を行うステップ
        dir("/root/cloud") {
          sh "terraform apply plan.out -no-color"
        }
      }
    }
  }
}
