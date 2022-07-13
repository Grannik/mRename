#!/bin/bash
 E='echo -e';
 e='echo -en';
#
 i=0; CLEAR; CIVIS;NULL=/dev/null
 trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
 CIVIS(){ $e "\e[?25l";}
 R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=40; a++ ))
          do
              TPUT $a 1
                        $E "\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m";
          done
              TPUT  1 1;$E "\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m"
              TPUT  3 3;$E "\e[1;36m*** rename ***\e[0m";
              TPUT  4 3;$E "\e[2mRenames multiple files                        переименовывает несколько файлов\e[0m";
              TPUT  5 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 15 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 16 3;$E "\e[36m Oпции                                                               Options\e[0m";
              TPUT 29 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 35 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 37 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 38 3;$E "\e[2m Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter \e[0m";
}
 FOOT(){ MARK;TPUT 41 1;$E "\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Установка                                                          \e[32m Install \e[0m";}
  M1(){ TPUT  7 3; $e " Kраткий обзор                                                     \e[32m Synopsis \e[0m";}
  M2(){ TPUT  8 3; $e " Описание                                                       \e[32m Description \e[0m";}
  M3(){ TPUT  9 3; $e " Автор                                                               \e[32m Author \e[0m";}
  M4(){ TPUT 10 3; $e " Смотрите также                                                    \e[32m See Also \e[0m";}
  M5(){ TPUT 11 3; $e " Окружающая среда                                               \e[32m Environment \e[0m";}
  M6(){ TPUT 12 3; $e " Диагностика                                                    \e[32m Diagnostics \e[0m";}
  M7(){ TPUT 13 3; $e " Ошибки                                                                \e[32m Bugs \e[0m";}
  M8(){ TPUT 14 3; $e " Файл                                                                  \e[32m File \e[0m";}
#
  M9(){ TPUT 17 3; $e " Manual: print manual page                                         \e[32m -m --man \e[0m";}
 M10(){ TPUT 18 3; $e " Help: print synopsis and options                                 \e[32m -h --help \e[0m";}
 M11(){ TPUT 19 3; $e " Version: show version number                                  \e[32m -V --version \e[0m";}
 M12(){ TPUT 20 3; $e " Показать, имена успешно переименованных файлов                \e[32m -v --verbose \e[0m";}
 M13(){ TPUT 21 3; $e " Использовать в качестве разделителя записей при чтении из STDIN  \e[32m -0 --null \e[0m";}
 M14(){ TPUT 22 3; $e " Показать, какие файлы были бы переименованы                      \e[32m -n --nono \e[0m";}
 M15(){ TPUT 23 3; $e " Принудительно перезаписать существующие файлы                   \e[32m -f --force \e[0m";}
 M16(){ TPUT 24 3; $e " Переименовать полный путь                                \e[32m --path --fullpath \e[0m";}
 M17(){ TPUT 25 3; $e " Не переименовывать каталог             \e[32m -d --filename --nopath --nofullpath \e[0m";}
 M18(){ TPUT 26 3; $e " Обрабатывайте имена файлов как строки Perl         \e[32m -u --unicode [encoding] \e[0m";}
 M19(){ TPUT 27 3; $e " Выражение: код для работы с именем файла                                \e[32m -e \e[0m";}
 M20(){ TPUT 28 3; $e " Утверждение: код работы с именем файла, как -e, но заканчивающийся \";\"  \e[32m -E \e[0m";}
#
 M21(){ TPUT 30 3; $e " Удалим лишний символ в именах файлов                    \e[32m rename 's/\-//g' * \e[0m";}
 M22(){ TPUT 31 3; $e " Массовое переименование файлов                         \e[32m rename 's/\+/_/g' * \e[0m";}
 M23(){ TPUT 32 3; $e " Преобразование регистров (верхний в нижний и наоборот)                      ";}
 M24(){ TPUT 33 3; $e " Изменим расширение всех файлов            \e[32m rename 's/\.html$/\.php/' *.html \e[0m";}
 M25(){ TPUT 34 3; $e " использовать переименование для перемещения файлов между каталогами         ";}
#
 M26(){ TPUT 36 3; $e " Grannik Git                                                                 ";}
#
 M27(){ TPUT 39 3; $e " Exit                                                                        ";}
LM=27
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Linux поставляется с очень мощным встроенным инструментом под названием\e[32m rename\e[0m

\e[32m sudo apt install rename\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m rename [-h|-m|-V][-v][-0][-n][-f][-d][-u[enc]][-e|-E\e[0m

 perlexpr: регулярные выражения для Perl:
\e[32m perlexpr]*|perlexpr[files]\e[0m\e[0m

 Основной синтаксис команды переименования:
\e[32m rename 's/old-name/new-name/' files\e[0m

\e[32m * \e[0m Звездочка говорит вам переименовать соответствующие файлы в текущем каталоге.
\e[32m **\e[0m переименовать все соответствующие файлы в подкаталогах.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m rename\e[0m переименовывает предоставленные имена файлов в соответствии с правилом,
 указанным в качестве первого аргумента. Аргумент perlexpr представляет собой вы-
 ражение Perl, которое, как ожидается, изменит строку \$_ в Perl по крайней мере
 для некоторых из указанных имен файлов. Если данное имя файла не изменено выраже-
 нием, оно не будет переименовано. Если имена файлов не указаны в командной строке,
 имена файлов будут считаны через стандартный ввод.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Larry Wall
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 mv, perl
\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Переменные окружения не используются.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Если вы дадите недопустимое выражение Perl, вы получите синтаксическую ошибку.
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Исходное «переименование» не проверяло наличие целевых имен файлов,
 поэтому его нужно было использовать с осторожностью.
";ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;echo -e "
 Команда «rename» является частью скрипта Perl
 и находится в разделе «/usr/bin/» во многих дистрибутивах Linux.
 Вы можете запустить команду:
\e[32m which rename\e[0m
 чтобы узнать местоположение команды rename.
";ES;fi;;
#
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m rename -m\e[0m
||
\e[32m rename --man\e[0m
";ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m rename -h\e[0m
||
\e[32m rename --help\e[0m
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m rename -V\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Никаких действий:
 вывести имена файлов, которые нужно переименовать, но не переименовывать.
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Перезапись существующих файлов. Если вы хотите принудительно перезаписать сущест-
 вующие файлы, используйте параметр «-f», как показано в примере ниже:
\e[32m rename -f 's/a/b/' *.html\e[0m
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Переименовать полный путь: включая любой компонент каталога. DEFAULT
\e[32m \e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Не переименовывать каталог: переименовывать только компонент имени файла пути.
\e[32m \e[0m";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Обрабатывайте имена файлов как строки Perl (Unicode) при запуске пользовательско-
 го кода. Декодировать/кодировать имена файлов, используя кодировку, если она при-
 сутствует. кодировка необязательна: если она опущена, следующим аргументом должна
 быть опция, начинающаяся с \e[32m-\e[0m, например -e.
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Выражение: код для работы с именем файла:
\e[32m \e[0m
 Может повторяться для создания кода (например, «perl -e»).
 Если нет -e, первый аргумент используется как код.
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Вы также можете написать операторы отдельно:
\e[32m rename -E 'y/A-Z/a-z/' -E 's/^/my_new_dir\//' *.*\e[0m
";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "
 Просто используйте следующую команду с выражением perl.

 Преобразовать все символы верхнего регистра в нижний регистр:
\e[32m rename 'y/A-Z/a-z/' *.HTML\e[0m

 Нижний регистр в верхний:
\e[32m rename 'y/a-z/A-Z/' *.html\e[0m
";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo -e "
 Примечание. В приведенной выше команде мы использовали два аргумента.
 Первый аргумент — это выражение perl, которое заменяет .html на .php.
 Второй аргумент — сообщает команде rename заменить все файлы на *.php.
";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m rename 'y/A-Z/a-z/;s/^/my_new_dir\//' *.*\e[0m
";ES;fi;;
#
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo -e "
 Mi 13 Jul 2022

 Описание утилиты mRename. Renames multiple files.
 Переименовывает несколько файлов.

 a - asciinema     file asciinema файл
 c - circular menu file общее меню
 s - source        file источник
 t - text          file текстовый файл
 l - bash list     file лист
 m - menu          file меню
 n - simple menu   file простое меню

 Asciinema:  \e[36m https://asciinema.org/a/508241\e[0m
 Github:     \e[36m https://github.com/GrannikOleg/mRename\e[0m
 Gitlab:     \e[36m https://gitlab.com/grannik/mrename\e[0m
 Sourceforge:\e[36m https://sourceforge.net/projects/mrename/files/\e[0m
 Notabug:    \e[36m https://notabug.org/Grannikoleg/mRename\e[0m
 Codeberg:   \e[36m https://codeberg.org/Grannik/mRename\e[0m
 Bitbucket:  \e[36m https://bitbucket.org/grannikoleg/workspace/projects/MREN\e[0m
 Framagit:   \e[36m https://framagit.org/GrannikOleg/mrename\e[0m
 Gitea:      \e[36m https://try.gitea.io/Grannik/mRename\e[0m
 GFogs: The owner has reached maximum creation limit of 10 repositories.
";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
