#!/bin/bash

function main(){
 
 clear && pwd

 read -p "select an option 
          1.open folder or file  
          2.create folder
          3.rename folder
          4.create file
          5.rename file
          0.go back to previous folder 
         
 " op_1

case $op_1 in
 
1)clear && pwd  | ls -1 | nl 

read -p "enter folder name  " file_name

 if [ -n $file_name ];then
  a=1
  while [ $a -lt 5 ]
  do
    if [ -e $file_name ]; then
  break
  fi
  echo "wrong file name "
  read -p "enter again " file_name
  ((a++))
 done

 if [ -d $file_name ]; then
   cd $file_name && ls -1 | nl
 main 
 elif [ -f $file_name ]; then
  vi $file_name
 main
fi
fi
;;

2) clear && pwd | ls -1 | nl && read -p "enter folder name  " f_name
     if [ -e $f_name ]; then
        for ((i=1;i<=5;i++))
         do
            echo "file alredy exists"
            read -p "enter again  " f_name
        if [ -z $f_name ]; then
         break
        fi
  done
fi
  if [ -n $f_name ]; then
   mkdir $f_name
  fi
;;

3) clear && pwd | ls -1 | nl && read -p "enter folder name  " o_name && read -p "enter new name  " n_name && mv $o_name $n_name
;;

4) clear && pwd | ls -1 | nl && read -p "enter file name  " f_name
     if [ -e $f_name ]; then
        for ((i=1;i<=5;i++))
         do
            echo "file alredy exists"
            read -p "enter again  " f_name
        if [ -z $f_name ]; then
         break
        fi
  done
fi
  if [ -n $f_name ]; then
   vi $f_name
  fi
;;

5)clear && pwd | ls -1 | nl && read -p "enter file name  " o_name && read -p "enter new name  " n_name && mv $o_name $n_name
;;

0 ) cd .. && clear && pwd && main
;;

*) echo "wrong input.exiting programe...." 

esac
}
main
