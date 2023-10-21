#!/bin/bash

echo "============================================================================================"
        echo "||                          Instalação do Agente Zabbix"
        echo "||                          Autor: EstagioGois"
        echo "||                          Versão: 1.0"
echo "============================================================================================"
# Descrição: Script para instalar o Agente Zabbix em diferentes versões do SO.

# Função para verificar e relatar erros
verificar_erro() {
  if [ $? -ne 0 ]; then
    echo "Erro: $1 falhou."
    exit 1
  fi
}
# Função para instalar o Agente Zabbix em uma versão específica do SO
instalar_agente() {
  case "$1" in
    "Debian 7")
      # Lógica de instalação do Agente Zabbix no Debian 7
        wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian7_all.deb
        verificar_erro "wget"
        dpkg -i zabbix-release_6.0-4+debian7_all.deb
        verificar_erro "dpkg"
        apt update
        verificar_erro "apt update"
        apt install zabbix-agent
        verificar_erro "apt install"
        systemctl start zabbix-agent
        verificar_erro "systemctl start"
        systemctl enable zabbix-agent
        verificar_erro "systemctl enable"
      ;;
    "Debian 8")
      # Lógica de instalação do Agente Zabbix no Debian 8
      echo "Instalando o Agente Zabbix no Debian 8..."
            # Lógica de instalação do Agente Zabbix no Debian 8
      echo "Instalando o Agente Zabbix no Debian 8..."

      # Adicionar o repositório do Zabbix e atualizar o sistema no Debian 8
      echo "Adicionando o repositório do Zabbix e atualizando o sistema no Debian 8..."
      wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+jessie_all.deb
      dpkg -i zabbix-release_5.0-1+jessie_all.deb
      apt update

      # Instalar o Agente Zabbix e seus plugins
      echo "Instalando o Agente Zabbix e seus plugins no Debian 8..."
      apt install zabbix-agent
      ;;
    "Debian 9")
      # Lógica de instalação do Agente Zabbix no Debian 9
      echo "Instalando o Agente Zabbix no Debian 9..."
       # Adicionar o repositório do Zabbix e atualizar o sistema no Debian 9
      echo "Adicionando o repositório do Zabbix e atualizando o sistema no Debian 9..."
      wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian9_all.deb
      dpkg -i zabbix-release_6.0-4+debian9_all.deb
      apt update

      # Instalar o Agente Zabbix 2 e seus plugins
      echo "Instalando o Agente Zabbix 2 e seus plugins no Debian 9..."
      apt install zabbix-agent2 zabbix-agent2-plugin-*

      # Iniciar o serviço do Agente Zabbix 2
      echo "Iniciando o serviço do Agente Zabbix 2..."
      systemctl start zabbix-agent2

      # Habilitar o serviço para iniciar automaticamente na inicialização do sistema
      echo "Habilitando o serviço para iniciar automaticamente na inicialização do sistema..."
      systemctl enable zabbix-agent2
      ;;
    "Debian 10")
      # Adicionar o repositório do Zabbix e atualizar o sistema no Debian 10
      echo "Adicionando o repositório do Zabbix e atualizando o sistema no Debian 10..."
      wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian10_all.deb
      dpkg -i zabbix-release_6.0-4+debian10_all.deb
      apt update

      # Instalar o Agente Zabbix 2 e seus plugins
      echo "Instalando o Agente Zabbix 2 e seus plugins no Debian 10..."
      apt install zabbix-agent2 zabbix-agent2-plugin-*

      # Iniciar o serviço do Agente Zabbix 2
      echo "Iniciando o serviço do Agente Zabbix 2..."
      systemctl start zabbix-agent2

      # Habilitar o serviço para iniciar automaticamente na inicialização do sistema
      echo "Habilitando o serviço para iniciar automaticamente na inicialização do sistema..."
      systemctl enable zabbix-agent2
      ;;
    "Debian 11")
      # Adicionar o repositório do Zabbix e atualizar o sistema no Debian 11
      echo "Adicionando o repositório do Zabbix e atualizando o sistema no Debian 11..."
      wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb
      dpkg -i zabbix-release_6.0-4+debian11_all.deb
      apt update

      # Instalar o Agente Zabbix 2 e seus plugins
      echo "Instalando o Agente Zabbix 2 e seus plugins no Debian 11..."
      apt install zabbix-agent2 zabbix-agent2-plugin-*

      # Iniciar o serviço do Agente Zabbix 2
      echo "Iniciando o serviço do Agente Zabbix 2..."
      systemctl start zabbix-agent2

      # Habilitar o serviço para iniciar automaticamente na inicialização do sistema
      echo "Habilitando o serviço para iniciar automaticamente na inicialização do sistema..."
      systemctl enable zabbix-agent2
      ;;
    "Debian 12")

      # Adicionar o repositório do Zabbix e atualizar o sistema no Debian 12
      echo "Adicionando o repositório do Zabbix e atualizando o sistema no Debian 12 (Bookworm)..."
      wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-5+debian12_all.deb
      dpkg -i zabbix-release_6.0-5+debian12_all.deb
      #Atualiza e Verifica
      #apt update || verificar_erro "apt update"
      #Atualiza e Verifica
      echo "Instalando o Agente Zabbix 2 e seus plugins no Debian 12..."
      apt install zabbix-agent2 zabbix-agent2-plugin-* || verificar_erro "apt install"
      #Atualiza e Verifica
      echo "Iniciando o serviço do Agente Zabbix 2..."
      systemctl start zabbix-agent2 || verificar_erro "systemctl start"
      #Atualiza e Verifica
      echo "Habilitando o serviço para iniciar automaticamente na inicialização do sistema..."
      systemctl enable zabbix-agent2 || verificar_erro "systemctl enable"
      ;;
      echo "Instalação concluida com sucesso!"  
    *)
      echo "Versão do SO não suportada."
      exit 1
      ;;
  esac
}

# Menu de seleção de versão do SO
echo "Selecione a versão do sistema operacional:"
echo "1. Debian 7"
echo "2. Debian 8"
echo "3. Debian 9"
echo "4. Debian 10"
echo "5. Debian 11"
echo "6. Debian 12"

read -p "Digite o número da versão desejada: " escolha

case "$escolha" in
  1)
    instalar_agente "Debian 7"
    ;;
  2)
    instalar_agente "Debian 8"
    ;;
  3)
    instalar_agente "Debian 9"
    ;;
  4)
    instalar_agente "Debian 10"
    ;;
  5)
    instalar_agente "Debian 11"
    ;;
  6)
    instalar_agente "Debian 12"
    ;;
  *)
    echo "Opção inválida."
    exit 1
    ;;
esac

# Resto do seu script, como configurações adicionais, pode seguir aqui
