#!/bin/bash

while true; do
  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  if [ "$choice" = "Add Password" ]; then
    echo "サービス名を入力してください："
    read service
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read password

    echo "$service:$username:$password" >> passwords.txt
    echo "パスワードの追加は成功しました。"

  elif [ "$choice" = "Get Password" ]; then
    echo "サービス名を入力してください："
    read service

    if grep -q "^$service:" passwords.txt; then
      grep "^$service:" passwords.txt
    else
      echo "そのサービスは登録されていません。"
    fi

  elif [ "$choice" = "Exit" ]; then
    echo "Thank you!"
    break

  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done