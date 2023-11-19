#!/bin/bash

echo "パスワードマネージャーへようこそ！"
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" answer
case "$answer" in "Add Password") #Add Passwordを入力したとき
        read -p "サービス名を入力してください:" service
        read -p "ユーザー名を入力してください:" user
        read -p "パスワードを入力してください:" pass

        echo -e "save1=サービス名:${service}\nsave2=ユーザー名:${user}\nsave3=パスワード:${pass}" > pass_save2.sh
        echo "パスワードの追加は成功しました"
        echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
        ;;
        "Get Password")
        read -p "サービス名を入力してください:" service2
        source pass_save2.sh
        research=$(echo $save1 | grep -o $service2)
        if [ $service2 = $research ]; then
                echo -e "$save1\n$save2\n$save3"
        else
                echo "そのサービスは登録されていません"
        fi
        ;;
        "Exit") #Exitが入力された場合
                echo "Thank you!"
        ;;
        *)
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください"
        ;;
esac

