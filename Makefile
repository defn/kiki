nexus-password:
	@docker-compose exec nexus cat /nexus-data/admin.password

nexus-test:
	@docker run -ti ubuntu:focal bash -c "apt update; apt install -y ca-certificates; sed 's#http://archive.ubuntu.com#https://nexus.defn.sh/repository#; s#http://security.ubuntu.com/ubuntu#https://nexus.defn.sh/repository/ubuntu-security#' -i /etc/apt/sources.list; apt update; apt upgrade -y"

