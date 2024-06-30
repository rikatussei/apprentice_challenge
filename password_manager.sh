#!/bin/bash

# パスワードマネージャーメッセージ
echo "パスワードマネージャーへようこそ！"

# 無限ループでユーザー入力を繰り返す
while true; do
    # メニュー表示
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)： " action

    case $action in
        "Add Password")
            read -p "サービス名を入力してください： " service
            read -p "ユーザー名を入力してください： " username
            read -sp "パスワードを入力してください： " password
            echo
            echo "$service:$username:$password" >> passwords.txt
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password")
            read -p "サービス名を入力してください： " service
            if grep -q "^$service:" passwords.txt; then
                grep "^$service:" passwords.txt | while IFS=: read -r svc usr pwd; do
                    echo "サービス名：$svc"
                    echo "ユーザー名：$usr"
                    echo "パスワード：$pwd"
                done
            else
                echo "そのサービスは登録されていません。"
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