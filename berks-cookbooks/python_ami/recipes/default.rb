#
# Cookbook:: python_ami
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update'

# package ["python3.8"]
# package ["python3-pip"]

bash 'installing python' do
  code <<-EOH
    sudo apt-get install python3.6 -y
    sudo apt-get install python3-pip -y
  EOH
end

bash 'installing app dependancies' do
  code <<-EOH
    pip3 install atomicwrites==1.3.0
    pip3 install attrs==19.1.0
    pip3 install beautifulsoup4=4.8.0
    pip3 install bs4
    pip3 install certifi==2019.6.16
    pip3 install chardet==3.0.4
    pip3 install config_manager
    pip3 install idna==2.8
    pip3 install importlib-metadata==0.19
    pip3 install more-itertools==7.2.0
    pip3 install packaging==19.1
    pip3 install pluggy==0.13.1
    pip3 install py==1.8.0
    pip3 install pyparsing==2.4.2
    pip3 install pytest==5.1.0
    pip3 install requests==2.22.0
    pip3 install six==1.12.0
    pip3 install soupsieve==1.9.2
    pip3 install urllib3==1.25.3
    pip3 install wcwidth==0.1.7
    pip3 install zipp==0.5.2
  EOH
end

 # Creates Downloads folder to output to
directory '/home' do
  action :create
  mode '0777'
end

directory '/home/vagrant/' do
  action :create
  mode '0777'
end

directory '/home/vagrant/Downloads/' do
  action :create
  mode '0777'
end

bash 'installing jenkins' do
  code <<-EOH
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
  sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt install default-jre -y
  sudo apt install default-jdk -y
  sudo apt-get install -y jenkins
  EOH
end

bash 'Downloads file in jenkins' do
  code <<-EOH
  cd /var/lib/jenkins
  sudo mkdir Downloads
  sudo chmod 777 Downloads/
  EOH
end
