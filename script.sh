#!/bin/bash 

        read -p "give source path to mount " ravi
        read -p "give the destination to mount "  roshan
        mount $ravi $roshan
        echo "[roshan]" > /etc/yum.repos.d/abc.repo
        echo "name=AppStream" >> /etc/yum.repos.d/abc.repo
        read -p "give the path of baseurl for AppStream " appstream_url
        echo "baseurl=$appstream_url" >> /etc/yum.repos.d/abc.repo
        read -p "Do you want to Enabel or Disable gpgcheck (y/n)" gpgcheck
        if [[ $gpgcheck == "y" || $gpgcheck == "Y" ]]
        then
                echo "gpgcheck=1" >> /etc/yum.repos.d/abc.repo
        else
        echo "gpgcheck=0" >> /etc/yum.repos.d/abc.repo
        fi
        echo "enabled=1" >> /etc/yum.repos.d/abc.repo

        echo "[roshan2]" >> /etc/yum.repos.d/abc.repo
        echo "name=BaseOS" >>/etc/yum.repos.d/abc.repo
        read -p "give the path of BaseOS" url_baseos
        echo "baseurl=$url_baseos " >> /etc/yum.repos.d/abc.repo
        read -p "Do you want to enable gpcheck [y/n]" enable_gpgcheck
        if [[ $enable_gpgcheck == "y" || $enable_gpgcheck == "Y"  ]];
        then
                echo "gpgcheck=1" >> /etc/yum.repos.d/abc.repo
        else
                echo "gpgcheck=0 " >> /etc/yum.repos.d/abc.repo
        fi

        echo "enabled=1" >> /etc/yum.repos.d/abc.repo
        yum makecache
        yum install httpd -y
        cd /var/www/html
        rm -rf *
        read -p "templete link " abc
        wget $abc
        unzip *.zip
        mv */* .
        systemctl enable --now  httpd


