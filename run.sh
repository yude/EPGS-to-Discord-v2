#!/bin/bash

# Discord Webhook URL
url=""

if [ $# = 1 ]; then

    # チャンネル名, チャンネルタイプ, 番組名, 番組概要の読み込み
    if [ -z "$CHANNELTYPE" ]; then
        CHANNELTYPE="チャンネルタイプ未設定"
    else
        :
    fi
    if [ -z "$CHANNELNAME" ]; then
        CHANNELNAME="放送局名なし"
    else
        :
    fi
    if [ -z "$HALF_WIDTH_NAME" ]; then
        title="タイトル未設定"
    else
        title=$HALF_WIDTH_NAME
    fi
    if [ -z "$HALF_WIDTH_DESCRIPTION" ]; then
        description="番組概要が指定されていません。"
    else
        description=$HALF_WIDTH_DESCRIPTION
    fi
    
    # 引数をコピー (コマンドとして認識されるのを防ぐため)
    ret=$1

    # 予約関係: 追加, 削除, 更新, 録画準備
    if [ $ret = "reserve" ]; then
        content="✅ **予約追加**\n番組名: ${title} @ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`"
    elif [ $ret = "deleted" ]; then
        content=":wastebucket: **予約削除**\n番組名: ${title}@ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`"
    elif [ $ret = "updated" ]; then
        content="🔁 **予約更新**\n番組名: ${title} @ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`"
    elif [ $ret = "prestart" ]; then
        content="🔷 **録画準備開始**\n番組名: ${title} @ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`"
    elif [ $ret = "prepfailed" ]; then
        content=":boom: **録画準備失敗**\n番組名: ${title} @ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`"
    elif [ $ret = "start" ]; then
        content=":record_button: **録画開始**\n番組名: ${title} @ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`"
    elif [ $ret = "stop" ]; then
        # エラー, ドロップ, スクランブルカウントを読み込み
        if [ -z "$ERROR_CNT" ]; then
            ERROR_CNT="N/A"
        else
            : # 何もしない
        fi
        if [ -z "$DROP_CNT" ]; then
            DROP_CNT="N/A"
        else
            : # 何もしない
        fi
        if [ -z "$SCRAMBLING_CNT" ]; then
            SCRAMBLING_CNT="N/A"
        else
            : # 何もしない
        fi
        content=":stop_button: **録画終了**\n番組名: ${title} @ ${CHANNELTYPE} ${CHANNELNAME}\n番組概要:\n\`\`\`\n${description}\n\`\`\`\nエラー: ${ERROR_CNT}, ドロップ: ${DROP_CNT}, スクランブル: ${SCRAMBLING_CNT}"
    else
        echo "引数が不正です。"
        exit 1
    fi
    
    # cURL で Webhook メッセージを送信
    curl -H "Content-Type: application/json" -X POST -d '{"username": "EPGStation", "content": "'"$content"'"}' $url
else
    echo "引数を指定してください。"
fi