#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 27);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=27;fi
 if [[ $aa -gt 27 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=27;fi
 if [[ $j1 -gt 27 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 27 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=39; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\e[0m\e[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[3;3H\e[1m *** rename ***\e[0m";
 echo -en "\e[4;3H\e[2m Renames multiple files                     переименовывает несколько файлов\e[0m";
 echo -en "\e[5;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[15;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[16;3H\e[36m Oпции                                                               Options\e[0m";
 echo -en "\e[29;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[35;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[37;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[40;1H\e[0m\e[47;30m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[6;3H Установка                                                          \e[32m Install \e[0m";}
  E1(){ echo -en "\e[7;3H Kраткий обзор                                                     \e[32m Synopsis \e[0m";}
  E2(){ echo -en "\e[8;3H Описание                                                       \e[32m Description \e[0m";}
  E3(){ echo -en "\e[9;3H Автор                                                               \e[32m Author \e[0m";}
  E4(){ echo -en "\e[10;3H Смотрите также                                                    \e[32m See Also \e[0m";}
  E5(){ echo -en "\e[11;3H Окружающая среда                                               \e[32m Environment \e[0m";}
  E6(){ echo -en "\e[12;3H Диагностика                                                    \e[32m Diagnostics \e[0m";}
  E7(){ echo -en "\e[13;3H Ошибки                                                                \e[32m Bugs \e[0m";}
  E8(){ echo -en "\e[14;3H Файл                                                                  \e[32m File \e[0m";}
  E9(){ echo -en "\e[17;3H Manual: print manual page                                         \e[32m -m --man \e[0m";}
 E10(){ echo -en "\e[18;3H Help: print synopsis and options                                 \e[32m -h --help \e[0m";}
 E11(){ echo -en "\e[19;3H Version: show version number                                  \e[32m -V --version \e[0m";}
 E12(){ echo -en "\e[20;3H Показать, имена успешно переименованных файлов                \e[32m -v --verbose \e[0m";}
 E13(){ echo -en "\e[21;3H Использовать в качестве разделителя записей при чтении из STDIN  \e[32m -0 --null \e[0m";}
 E14(){ echo -en "\e[22;3H Показать, какие файлы были бы переименованы                      \e[32m -n --nono \e[0m";}
 E15(){ echo -en "\e[23;3H Принудительно перезаписать существующие файлы                   \e[32m -f --force \e[0m";}
 E16(){ echo -en "\e[24;3H Переименовать полный путь                                \e[32m --path --fullpath \e[0m";}
 E17(){ echo -en "\e[25;3H Не переименовывать каталог             \e[32m -d --filename --nopath --nofullpath \e[0m";}
 E18(){ echo -en "\e[26;3H Обрабатывайте имена файлов как строки Perl         \e[32m -u --unicode [encoding] \e[0m";}
 E19(){ echo -en "\e[27;3H Выражение: код для работы с именем файла                                \e[32m -e \e[0m";}
 E20(){ echo -en "\e[28;3H Утверждение: код работы с именем файла, как -e, но заканчивающийся \";\"  \e[32m -E \e[0m";}
 E21(){ echo -en "\e[30;3H Удалим лишний символ в именах файлов                    \e[32m rename 's/\-//g' * \e[0m";}
 E22(){ echo -en "\e[31;3H Массовое переименование файлов                          \e[32m rename 's/a/b/g' * \e[0m";}
 E23(){ echo -en "\e[32;3H Преобразование регистров (верхний в нижний и наоборот)                      ";}
 E24(){ echo -en "\e[33;3H Изменим расширение всех файлов            \e[32m rename 's/\.html$/\.php/' *.html \e[0m";}
 E25(){ echo -en "\e[34;3H использовать переименование для перемещения файлов между каталогами         ";}
 E26(){ echo -en "\e[36;3H                                                                        \e[34m Git \e[0m";}
 E27(){ echo -en "\e[38;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Linux поставляется с очень мощным встроенным инструментом под названием\e[32m rename\e[0m
\e[32m sudo apt install rename\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename [-h|-m|-V][-v][-0][-n][-f][-d][-u[enc]][-e|-E\e[0m

 perlexpr: регулярные выражения для Perl:
\e[32m perlexpr]*|perlexpr[files]\e[0m\e[0m

 Основной синтаксис команды переименования:
\e[32m rename 's/old-name/new-name/' files\e[0m

\e[32m * \e[0m Звездочка говорит вам переименовать соответствующие файлы в текущем каталоге.
\e[32m **\e[0m переименовать все соответствующие файлы в подкаталогах.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename\e[0m переименовывает предоставленные имена файлов в соответствии с правилом,
 указанным в качестве первого аргумента. Аргумент perlexpr представляет собой вы-
 ражение Perl, которое, как ожидается, изменит строку \$_ в Perl по крайней мере
 для некоторых из указанных имен файлов. Если данное имя файла не изменено выраже-
 нием, оно не будет переименовано. Если имена файлов не указаны в командной строке,
 имена файлов будут считаны через стандартный ввод.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Larry Wall
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 mv, perl
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Переменные окружения не используются.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Если вы дадите недопустимое выражение Perl, вы получите синтаксическую ошибку.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Исходное «переименование» не проверяло наличие целевых имен файлов,
 поэтому его нужно было использовать с осторожностью.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Команда «rename» является частью скрипта Perl
 и находится в разделе «/usr/bin/» во многих дистрибутивах Linux.
 Вы можете запустить команду:
\e[32m which rename\e[0m
 чтобы узнать местоположение команды rename.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename -m\e[0m
||
\e[32m rename --man\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename -h\e[0m
||
\e[32m rename --help\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename -V\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Никаких действий:
 вывести имена файлов, которые нужно переименовать, но не переименовывать.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перезапись существующих файлов. Если вы хотите принудительно перезаписать сущест-
 вующие файлы, используйте параметр «-f», как показано в примере ниже:
\e[32m rename -f 's/a/b/' *.html\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[47;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Переименовать полный путь: включая любой компонент каталога. DEFAULT
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[47;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Не переименовывать каталог: переименовывать только компонент имени файла пути.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[47;30m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обрабатывайте имена файлов как строки Perl (Unicode) при запуске пользовательско-
 го кода. Декодировать/кодировать имена файлов, используя кодировку, если она при-
 сутствует. кодировка необязательна: если она опущена, следующим аргументом должна
 быть опция, начинающаяся с \e[32m-\e[0m, например -e.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[47;30m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Выражение: код для работы с именем файла:
\e[32m \e[0m
 Может повторяться для создания кода (например, «perl -e»).
 Если нет -e, первый аргумент используется как код.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[47;30m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Вы также можете написать операторы отдельно:
\e[32m rename -E 'y/A-Z/a-z/' -E 's/^/my_new_dir\//' *.*\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[47;30m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[47;30m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename 's/_resized/0854x0480/' *.jpg\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[47;30m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Просто используйте следующую команду с выражением perl.

 Преобразовать все символы верхнего регистра в нижний регистр:
\e[32m rename 'y/A-Z/a-z/' *.HTML\e[0m

 Нижний регистр в верхний:
\e[32m rename 'y/a-z/A-Z/' *.html\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[47;30m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Примечание. В приведенной выше команде мы использовали два аргумента.
 Первый аргумент — это выражение perl, которое заменяет .html на .php.
 Второй аргумент — сообщает команде rename заменить все файлы на *.php.
#
 Примечание файлов с расширением .sh на .txt
\e[32m rename 's/\\.sh\$/\\.txt/' *.sh\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[47;30m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m rename 'y/A-Z/a-z/;s/^/my_new_dir\//' *.*\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[47;30m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Описание утилиты mRename. Renames multiple files.
 Переименовывает несколько файлов.
 Asciinema:  \e[36m https://asciinema.org/a/508241\e[0m
 Github:     \e[36m https://github.com/GrannikOleg/mRename\e[0m
 Gitlab:     \e[36m https://gitlab.com/grannik/mrename\e[0m
 Sourceforge:\e[36m https://sourceforge.net/projects/mrename/files/\e[0m
 Notabug:    \e[36m https://notabug.org/Grannikoleg/mRename\e[0m
 Codeberg:   \e[36m https://codeberg.org/Grannik/mRename\e[0m
 Bitbucket:  \e[36m https://bitbucket.org/repo/import/3109410\e[0m
 Framagit:   \e[36m https://framagit.org/GrannikOleg/mrename\e[0m
 Gitea:      \e[36m https://try.gitea.io/Grannik/mRename\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[47;30m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
