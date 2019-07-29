WP-Apache-MariaDB+PHP+phpMyAdmin
====

Overview

## Description

Simple Install WordPress, Nginx, PHP-FPM, PHP, MySQL


## Requirement

1. AWS EC2
2. AMI: CentOS Linux 7 x86_64 HVM EBS ENA 1901_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-05713873c6794f575.4 (ami-045f38c93733dd48d)


## Usage

<p>1. Change root User</p>

```
$ sudo su -
# git clone git@github.com:yuukanehiro/Shell-Stack.git
```

```
# cd ./Ansible-Stack/WP-Apache-MariaDB+PHP+phpMyAdmin/shell
# sh ./Ansible-Stack/WP-Apache-MariaDB+PHP+phpMyAdmin/shell/1_set_Up_Ansible_Host.sh
```


<p>2. Setting Environmentr</p>


```
# vi .ssh/config
 
 
Host yuruhack-web101
    HostName 192.168.11.101
 
Host yuruhack-web102
    HostName 192.168.11.102
 
Host yuruhack-web103
    HostName 192.168.11.103
 
Host yuruhack-web104
    HostName 192.168.11.104
```


```
# ssh-copy-id yuruhack-web101
 
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
The authenticity of host '192.168.11.101 (192.168.11.101)' can't be established.
ECDSA key fingerprint is SHA256:8BSC790xfrVG130x7Lklexd2nrrAtLmSQPujj5FAdYg.
ECDSA key fingerprint is MD5:fb:12:e5:e5:ec:79:a1:28:ee:7a:ed:71:37:98:36:02.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@192.168.11.101's password:
 
Number of key(s) added: 1
 
Now try logging into the machine, with:   "ssh 'yuruhack-web101'"
and check to make sure that only the key(s) you wanted were added.
```


```
# ssh-copy-id yuruhack-web102
# ssh-copy-id yuruhack-web103
# ssh-copy-id yuruhack-web104
```


```
# vi /etc/ansible/hosts
 

[web]
192.168.11.101
192.168.11.102
192.168.11.103
192.168.11.104
```

```
# ansible all -i /etc/ansible/hosts -m ping
 
192.168.11.102 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
192.168.11.101 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
192.168.11.104 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
192.168.11.103 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```


<p>3. Execute!</p>




## Author

[yuu kanehiro](https://github.com/yuukanehiro)
