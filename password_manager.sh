#!/bin/bash

# パスワードマネージャーメッセージ
echo "パスワードマネージャーへようこそ！"

# ユーザー入力の取得
read -p "サービス名を入力してください: " service
read -p "ユーザー名を入力してください: " username
read -sp "パスワードを入力してください: " password
echo

# 入力内容の確認
echo "Thank you!"

# 入力内容をファイルに保存
echo "$service:$username:$password" >> passwords.txt

# 保存完了メッセージ
echo "情報が保存されました。"