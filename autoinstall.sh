
installvim() {
        #Actualiza el sistema
        sudo apt update

        # Instala curl si no lo tienes
        sudo apt install curl -y 

        # Instalacion de vim   
        sudo apt install vim $$ echo "OK"

        # Instalacion de vimplug
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        # Instalacion de node.js para coc.plug 
        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
        sudo apt install -y nodejs && echo "OK"
                
        #Descomprime el archivo con las configuraciones
        tar -xzvf ~/mi-vim-config.tar.gz && echo "OK"

        #Inicia la instalacion de los plugins con vimplug
        vim +PlugInstall +qall

        #Elimina los archivos
        rm -rf ~/mi-vim-config.tar.gz
        rm -- "$0"
}


while true; do
        echo "Quieres descargar vim con la configuracion de este repositorio"
        read -p "si (1) o no (2) : " menu1
        clear
        case $menu1 in
                1)
                        installvim
                        ;;
                2)
                        echo "Estas saliendo del instalador"
                        sleep 2
                        exit
                        ;;
                *) 
                        menu_1
                        ;;
        esac
done
