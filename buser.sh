#!/bin/bash
#Written by Griffin Trull
#/tmp/userlist

while getopts ":a:d:l" flag;do
        case $flag in
                a) echo "which users would you like to add?";useradd="$OPTARG";
			if [ ${useradd: -4} == ".txt" ]
			then
				for user in `cat $useradd`
                                        do
                                        echo "adding user $user"
                                        sudo useradd $user 
                                done
			else
				echo "adding user $useradd"
                                sudo useradd $useradd
			fi
			;;
                d) echo "which users would you like to delete?";userdelete="$OPTARG";
			if [ ${userdelete: -4} == ".txt" ]
                        then
                                for user in `cat $userdelete`
                                        do
                                        echo "deleting user $user"
                                        sudo userdel $user
                                done
                        else
                                echo "deleting user $userdelete"
                                sudo userdel $userdelete
                        fi
                        ;;
                l) echo "listing all users int the /etc/passwd directory";
                cat  /etc/passwd | grep "/home";; 
        esac
done


