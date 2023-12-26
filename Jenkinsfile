pipeline {
  // エージェントを指定
  agent any

  options {
    // デフォルトのチェックアウトをスキップ
    skipDefaultCheckout(true)
  }

  tools {
    // Terraformのバージョンを指定
    terraform "terraform-1.6.6"
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
        sh "terraform init -no-color"
      }
    }
    // Terraformのプラン作成ステージ
    stage("terraform plan") {
      steps {
        // プランを作成するステップ
        sh "terraform plan -no-color -out=plan.out"
        // プランを適用するか確認するインプット
        input message: "Apply Plan?", ok: "Apply"
      }
    }
    // Terraformの適用ステージ
    stage("terraform apply") {
      steps {
        // Terraformの適用を行うステップ
        sh "terraform apply plan.out -no-color"
      }
    }
  }
}
