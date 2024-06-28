Kids Songs.

----

ubuntu docker 增加中文：

$ export LANG=zh_CN.UTF-8

$ apt-get install  -y language-pack-zh-hans nano

----

简易实现级数谱方法，示例见：萱草花

$ vim /usr/local/lilypond/usr/share/lilypond/current/scm/chord-name.scm

lilypond 2.20.0,  注释 122 行，增加以下行：

             ;;#("①" "②" "③" "④" "⑤" "⑥" "⑦"))
             ;;#("➊" "➋" "➌" "➍" "➎" "➏" "➐"))
             ;;#("㊀" "㊁" "㊂" "㊃" "㊄" "㊅" "㊆"))
             #("１" "２" "３" "４" "５" "６" "７"))
             ;;#("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ"))

其他版本不一定一样。比如 2.24版本该函数实现方式不同，不能通过添加以上行来实现。
