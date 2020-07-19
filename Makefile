nexus-password:
	@docker-compose exec nexus cat /nexus-data/admin.password

nexus-test:
	@docker run -ti docker.defn.sh/ubuntu:focal bash -c "apt update; apt install -y ca-certificates; sed 's#http://archive.ubuntu.com/ubuntu#https://nexus.defn.sh/repository/ubuntu#; s#http://security.ubuntu.com/ubuntu#https://nexus.defn.sh/repository/ubuntu-security#' -i /etc/apt/sources.list; apt update; apt upgrade -y; apt install -y vim"
	@docker run -ti docker.defn.sh/debian:buster bash -c "apt update; apt install -y ca-certificates; sed 's#http://deb.debian.org/debian#https://nexus.defn.sh/repository/debian#; s#http://security.debian.org/debian-security#https://nexus.defn.sh/repository/debian-security#' -i /etc/apt/sources.list; apt update; apt upgrade -y; apt install -y vim"

go-env:
	go env -w GO111MODULE=on
	go env -w GOPROXY="https://nexus.defn.sh/repository/go/,direct"
