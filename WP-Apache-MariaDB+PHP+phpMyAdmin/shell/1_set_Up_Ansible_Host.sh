#!/bin/sh
set -e

# スクリプトディレクトリの取得
SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR



## 必要モジュールのインストール ========
sudo yum -y install epel-release
sudo yum -y install ansible
sudo yum -y install MySQL-python
sudo yum -y install libselinux-python
sudo yum -y install rsync
sudo yum -y install wget
sudo yum -y install unzip


## 公開鍵作成 ==========================
sudo ssh-keygen -t rsa -b 4096 -N ""

# SSHターゲットサーバ設定ファイル設置
sudo mkdir -p $HOME/.ssh/
sudo cp ./.ssh_config $HOME/.ssh/config


## WordPress最新ファイル取得
sudo wget https://ja.wordpress.org/latest-ja.zip
sudo unzip latest-ja.zip
mv wordpress/* ../ansible/v1/web/httpdocs/


## SELinux 無効化 ===============================================================
#sudo sed -i -e "s|SELINUX=enforcing|SELINUX=disabled|" /etc/sysconfig/selinux
#sudo sed -i -e "s|SELINUX=enforcing|SELINUX=disabled|" /etc/selinux/config



## 再起動 ===========
#sudo reboot now
