#!/bin/bash
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "                ____             __       _____ __         ____                 +"
echo "               / __ )__  _______/ /_     / ___// /_  ___  / / /                 +"                
echo "              / __  / / / / ___/ __ \    \__ \/ __ \/ _ \/ / /                  +"
echo "             / /_/ / /_/ (__  ) / / /   ___/ / / / /  __/ / /                   +"
echo "            /_____/\__,_/____/_/ /_/   /____/_/ /_/\___/_/_/                    +"
echo "                                                                                +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
       

help_pls(){
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "+                  _          _                              +"
        echo "+                 | |__   ___| |_ __                         +"
        echo "+                 | '_ \ / _ \ | '_ \                        +" 
        echo "+                 | | | |  __/ | |_) |                       +"
        echo "+                 |_| |_|\___|_| .__/                        +"
        echo "+                              |_|                           +"
	echo "+                                                            +"
	echo "+ Date??           pls type   ==> date_pls                   +"
	echo "+ about??          pls type   ==> about                      +"
	echo "+ SELinux??        pls type   ==> selinux                    +"
	echo "+ Lamp_install??   pls type   ==> lamp                       +"
	echo "+ Exit??           pls type   ==> exit                       +"
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}

OS(){

	if [ $(cat /etc/redhat-release | awk '{printf $1}') = Fedora ]
	then
	echo "-	Ur OS is Fedora and u have permission to run this script"
	elif [ $(cat /etc/redhat-release | awk '{printf $1}') = CentOS ]
	then
	echo "-	Ur OS is Fedora and u have permission to run this script"
	elif [ $(cat /etc/redhat-release | awk '{printf $1,$2}') = "Red Hat" ]
	then
	echo "-	Ur OS is Red Hat and u have permission to run this script"
	else 
	echo "-	U have no permission to run this script.To run this script ur os must be Fedora or CentOs or Red Hat" 
	fi
}


arc(){
	if [ $(uname -p) = x86_64 ]
	then
	echo "-	Ur system architecture is 64 bit"
	elif [ $(uname -p) = i386 ] 
	then
	echo "-	Ur system architecture is 32 bit"
	elif [ $(uname -p) = i486 ] 
	then
	echo "-	Ur system architecture is 32 bit"
	elif [ $(uname -p) = i586 ] 
	then
	echo "-	Ur system architecture is 32 bit"
	else
	echo -e "-	Ur system architecture is" $(uname -p)
	fi
}

host_pls(){
	echo "-	Host name is " $(hostname)
}


selinux(){
	echo "Bush> selinux>"
	if [ $(getenforce) = Enforcing ]
	then 
	echo "SELinux is enforcing"
	elif [ $(getenforce) = Permissive ]
	then
	setenforce 1
	echo "SELinux is Permissive and now have changed Enforcing mode"
	else
	echo "SELinus is Disable"
	fi
}


date_pls()
	{
	echo "Bush> date>"
	echo " $(date | awk '{printf $3}') Day"
	echo " $(date | awk '{printf $2}') Month"
	echo " $(date | awk '{printf $6}') Year"
	echo " $(date | awk '{printf $4}') Time"	
}

about(){
	echo "Bush> about>"
	echo "This shell is called Bush shell and developed by Psyche"
}
all(){

apache
php
maria
maria
fwall
anti
rkhunter
}

lamp(){
	echo "__________________________________________"
	echo "|                                         |"
	echo "|              Installing LAMP            |"
	echo "|_________________________________________|"
	echo ""
	echo ""
	echo "Firstly u must update YUM and must keep SELinux's mode Enforcing now yum is installing"
	echo "yum update -y"
	echo "yum install epel_release -y"
	echo "Now,What do u want to install????"
	echo "Objectives"
	echo "1.Apache Web Server"
	echo "2.PHP"
	echo "3.MariaDB (MySQL Database)"
	echo "4.Firewall"
	echo "5.Anti-Virus"
	echo "6.Rootkit Hunter"
	echo "7.All"
	echo "8.back to main"
	while true
	do
	echo -n "Bush> Server> " & read server
	case $server in
	1) apache
	;;
	2) php
	;;
	3) maria
	;;
	4) fwall
	;;
	5) anti
	;;
	6) rkhunter
	;;
	7) all
	;;
	8)main
	;;
	*) eval $server
	esac
	done

}

apache(){
	if [ -f /etc/httpd/conf/httpd.conf ]
	then
	echo "Apache Server is already installed"
	else
	echo "Apache is installing"
	echo "yum install httpd -y"
	echo "systemctl start httpd"
	echo "systemctl enable httpd"
	fi
}




php(){
	if [ -f /etc/httpd/conf.d/php.conf ]
	then
	echo "PHP is already installed"
	else 
	echo "PHP is installing"
	echo "yum inatall php php-mysql php-mbstring php-mcrypt php-pshell php-gd -y"
	echo "systemctl restart httpd"
	fi
}


maria(){
	if [ -f /etc/my.conf ]
	then
	echo "Mysql is already installed"
	else

read -p "Define Mysql root user password:" mysqlrootpwd
SECURE_MYSQL=$(expect -c "

set timeout 10
spawn mysql_secure_installation 

expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"

expect \"Change the root password?\"
send \"y\r\"

expect \"New Password:\"
send \"$mysqlrootpwd\r\"

expect \"Re-enter new password:\"
send \"$mysqlrootpwd\r\"

expect \"Remove anonymous users?\"
send \"y\r\"?\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"?\"

expect \"Reload privilege tables now?\"
send \"y\r\"?\"

expect eof
")

echo "$SECURE_MYSQL"

fi
}



fwall(){
	if [ -f /etc/firewalld/firewall-standard.conf ]
	then
	echo "Firewall is already installed"
	else
	echo "yum install firewalld"
	echo "systemctl start firewalld"
	echo "systemctl enable firewalld"
	echo "firewall-cmd --zone=public --add-service=http --permanent"
        echo "firewall-cmd --reload"
	fi
}

anti(){
	if [ -f /etc/freshclam.conf ]
	then
	echo "Anto Virus has already installed"
	else
	echo "-----------------------------------------------"
	echo "-             installing.....                 -"
	echo "-----------------------------------------------"
	echo "yum install clamav clamav-update clamav-scanner -y"
	fi
}

rkhunter(){
	if [ -f /etc/rkhunter.conf ]
	then
	echo "Rootkit hunter is already installed"
	else
	echo "-------------------------------------------"
	echo "-            installing........            "
	echo "-------------------------------------------"
	echo "yum install rkhunter -y"
	fi
	}







                                                                                                                   

if [ $(whoami) != root ]
then
echo "Run this script with root user"
exit
else
echo "----------------------------------------------------------------------------"
echo "-                    	           _        __             	     	 -"
echo "-                         	  (_)_ __  / _| ___             	 -"
echo "-                 	          | | '_ \| |_ / _ \            	 -"
echo "-         	                  | | | | |  _| (_) |           	 -"
echo "- 	                          |_|_| |_|_|  \___/            	 -"
echo "-                                                         		 -"
			OS
			arc
     			host_pls
echo "----------------------------------------------------------------------------"
	

	info=`zenity --username --password`
	usr=`echo $info | cut -d'|' -f1`
	pass=`echo $info | cut -d'|' -f2`
	echo "-----------------------------------------------------------"
	echo "-        You may need help so pls type \"help_pls\"        -"
	echo "-----------------------------------------------------------"
	while true
        do
	if [ $usr = "Psyche" ]
	then
		if [ $(echo $pass | openssl dgst -md5 | awk '{printf $2}') = "5e18d6767f3315c9b9bed45101d22bd2" ]
		then
		main(){	echo -n "Bush> " & read input
			case $input in
			selinus) selinux
			;;
			date) date_pls
			;;
			LAMP_installation) lamp
			;;
			help_pls) help_pls
			;;
			about) about
			;;
			exit) exit 
			;;
			*) eval $input
			esac

}
main
			else
			echo "Ur pass is not correct"
			exit
			fi
		else 
		echo "Ur user is not correct"
		exit
		fi
	done
	

fi

