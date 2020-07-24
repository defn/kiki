nexus-password:
	@docker-compose exec nexus cat /nexus-data/admin.password

nexus-test:
	@docker run -ti docker.$(KITT_DOMAIN)/ubuntu:focal bash -c "apt update; apt install -y ca-certificates; sed 's#http://archive.ubuntu.com/ubuntu#https://nexus.$(KITT_DOMAIN)/repository/ubuntu#; s#http://security.ubuntu.com/ubuntu#https://nexus.$(KITT_DOMAIN)/repository/ubuntu-security#' -i /etc/apt/sources.list; apt update; apt upgrade -y; apt install -y vim"
	@docker run -ti docker.$(KITT_DOMAIN)/debian:buster bash -c "apt update; apt install -y ca-certificates; sed 's#http://deb.debian.org/debian#https://nexus.$(KITT_DOMAIN)/repository/debian#; s#http://security.debian.org/debian-security#https://nexus.$(KITT_DOMAIN)/repository/debian-security#' -i /etc/apt/sources.list; apt update; apt upgrade -y; apt install -y vim"

go-env:
	go env -w GO111MODULE=on
	go env -w GOPROXY="https://nexus.$(KITT_DOMAIN)/repository/go/,direct"
