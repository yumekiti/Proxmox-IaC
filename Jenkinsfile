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
    // 環境変数を設定するステージ
    stage("set environment variables") {
      steps {
        // 環境変数を設定するステップ
        sh "export TF_VAR_api_url=\"${TF_VAR_api_url}\""
        sh "export TF_VAR_pve_token_id=\"${TF_VAR_pve_token_id}\""
        sh "export TF_VAR_pve_token_secret=\"${TF_VAR_pve_token_secret}\""
        sh "export TF_VAR_private_key_path=\"${TF_VAR_private_key_path}\""
        sh "export TF_VAR_public_key_path=\"${TF_VAR_public_key_path}\""
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
