#!/bin/bash
echo "============================================================================================"
        echo "                          Instalação do Agente Zabbix"
        echo "                          Autor: EstagioBel"
        echo "                          Versão: 1.0"
echo "============================================================================================"
# Função para identificar a versão do sistema operacional
get_os_version() {
  if [ -f /etc/os-release ]; then
    source /etc/os-release
    echo "$NAME $VERSION"
  elif [ -f /etc/centos-release ]; then
    echo "CentOS $(cat /etc/centos-release | cut -d ' ' -f 4)"
  elif [ -f /etc/debian_version ]; then
    echo "Debian $(cat /etc/debian_version)"
  else
    echo "Não foi possível identificar a versão do sistema operacional."
    exit 1
  fi
}
# Verifica se o wget está instalado
if ! command -v wget &>/dev/null; then
  echo "wget não está instalado. Instalando..."
  case "$os_version" in
    "Ubuntu"*) install_wget_ubuntu ;;
    "CentOS"*) install_wget_centos ;;
    "Debian"*) install_wget_debian ;;
    *) echo "Instalação do wget não suportada para esta distribuição." ;;
  esac
fi
# Função para instalar o wget no CentOS
install_wget_centos() {
  sudo yum install -y wget
}

# Função para instalar o wget no Debian
install_wget_debian() {
  sudo apt-get update
  sudo apt-get install -y wget
}

# Identifica o sistema operacional
os_version=$(get_os_version)

echo "Sistema Operacional: $os_version"

# Instala o wget com base na distribuição
case "$os_version" in
  "Ubuntu"*) install_wget_ubuntu ;;
  "CentOS"*) install_wget_centos ;;
  "Debian"*) install_wget_debian ;;
  *) echo "Instalação do wget não suportada para esta distribuição." ;;
esac