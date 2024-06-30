FILE="passwords.txt"

echo "パスワードマネージャーへようこそ！"

echo -n "サービス名を入力してください："
read service_name

echo -n "ユーザー名を入力してください："
read user_name

echo -n "パスワードを入力してください："
read -s password
echo

echo "Thank you!"

echo "$service_name:$user_name:$password" >> $FILE

echo "情報が保存されました。"