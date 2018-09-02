class docker {
        case $::osfamily{
                "redhat":{
			package{["yum-utils","device-mapper-persistent-data","lvm2"]:
                                ensure => present
					  
			}

			exec{"instalar GPG key":
				command => "/bin/yum yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo; /bin/yum yum-config-manager --enable docker-ce-edge; yum-config-manager --enable docker-ce-test; bin/yum yum install docker-ce"

 				} 				

                }
                "debian":{
                        exec{'atualizar_pacotes':
                                command => "/usr/bin/apt update"
                        }
                        $package = ["apt-transport-https","ca-certificates","curl","gnugp2","software-properties-common"]
			package {$package:
			ensure => present



}
	
	exec{"instalar GPG key":
	command => "/usr/bin/curl  -fsSL https://download.docker.com/linux/debian/gpg | /usr/bin/apt-key add -; /usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable'" 

}

	exec{"instalar Docker":

	command => "/usr/bin/apt update; /usr/bin/apt install docker-ce -y"}
}
}
}
