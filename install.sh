#!/bin/bash

cat ./sicoob.txt

echo "Automatizador De Instalação Da Sicoobnet Empresarial - Versão Legada"
echo "** ATENÇÃO ESSA É A VERSÃO LEGADA DO PROGRAMA SICOOBNET EMPRESARIAL. A INSTALAÇÃO FICA POR SUA COMTA E RISCO."
echo "============================================================================================================="


if [ -d {$HOME}'/sicoobnet' ]; then
		mkdir ${HOME}'/sicoobnet' && cd ${HOME}'/sicoobnet'
else
		cd ${HOME}'/sicoobnet'
fi

function installing () {
		if [ -e "/usr/bin/java" ]; then
				if [ -e "/usr/bin/javaws" ]; then
						javaws InstaladorLegadoSicoobnetEmpresarial.jnlp
						cp run.sh ./Sicoobnet/
						echo -e "[Desktop Entry]\nVersion=1.0\nName=SicoobNet\nGenericName=Geren	ciador Financeiro SicoobNet\nGenericName[fil]=Gerenciador Financeiro SicoobNet\nComment=Gerenciador Financeiro SicoobNet\nExec=$HOME/sicoobnetEmpresarial-autoInstall/run.sh\nTerminal=false\nIcon=$HOME/sicoobnetEmpresarial-autoInstall/SicoobEmp001.ico\nType=Application\nCategories=restart;Finance;" >> $HOME/Desktop/SicoobNet.desktop
				else
						echo "Verificando base da distro..."
						
						if cat /etc/*-release | grep ID=arch; then
								echo "É uma distro baseada em Arch";
								echo "Atualizando e instalando dependências"
								sudo pacman -Syu &&
										sudo pacman -S jre8-openjdk &&
										sudo pacman -S icedtea-web
						fi

						if cat /etc/*-release | grep ID=ubuntu || cat /etc/*-release | grep ID=debian; then
								echo "É uma distro baseada em Debian";
								echo "Atualizando e instalando dependências"
								sudo apt update && sudo apt install openjdk-8-jdk
						fi

						echo "Verifique se o java 8 e IcedTea-Web"
						
				fi
		else
				
				echo "Verificando base da distro..."
				if cat /etc/*-release | grep ID=ubuntu; then
						echo "É uma distro baseada em Arch";
						echo "Atualizando e instalando dependências"
						sudo pacman -Syu && sudo pacman -S jre8-openjdk
				fi

				if cat /etc/*-release | grep ID=debian; then
						echo "É uma distro baseada em Debian";
						echo "Atualizando e instalando dependências"
						sudo apt update && sudo apt install openjdk-8-jdk
				fi
				
		fi
}

if [ -e "InstaladorLegadoSicoobnetEmpresarial.jnlp" ]; then
		installing
else
		
		wget https://empresarial.sicoobnet.com.br/instalador/InstaladorLegadoSicoobnetEmpresarial.jnlp
		
		if [ -e "InstaladorLegadoSicoobnetEmpresarial.jnlp" ]; then
				installing
		fi
fi

