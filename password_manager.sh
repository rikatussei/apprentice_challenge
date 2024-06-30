#!/bin/bash

# ファイルを暗号化・復号化するためのパスフレーズ
PASSPHRASE="your_secure_passphrase"

# パスワードマネージャーのメインメニュー
while true; do
  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  case $choice in
    "Add Password")
      echo "サービス名を入力してください："
      read service
      echo "ユーザー名を入力してください："
      read username
      echo "パスワードを入力してください："
      read password
      echo "$service:$username:$password" >> temp_passwords.txt
      echo $PASSPHRASE | gpg --batch --yes --passphrase-fd 0 -c temp_passwords.txt
      mv temp_passwords.txt.gpg passwords.gpg
      rm temp_passwords.txt
      echo "パスワードの追加は成功しました。"
      ;;
    "Get Password")
      if [ -f passwords.gpg ]; then
        echo $PASSPHRASE | gpg --batch --yes --passphrase-fd 0 -o temp_passwords.txt -d passwords.gpg
        echo "サービス名を入力してください："
        read service
        if grep -q "^$service:" temp_passwords.txt; then
          grep "^$service:" temp_passwords.txt | while IFS=":" read -r svc user pass; do
            echo "サービス名：$svc"
            echo "ユーザー名：$user"
            echo "パスワード：$pass"
          done
        else
          echo "そのサービスは登録されていません。"
        fi
        rm temp_passwords.txt
      else
        echo "暗号化されたパスワードファイルが見つかりません。"
      fi
      ;;
    "Exit")
      echo "Thank you!"
      break
      ;;
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done
