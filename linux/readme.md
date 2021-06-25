# Install on Linux

## Put this command in terminal
~~~
if [ $EUID = 0 ]; then clear; echo "you cannot run this as root"; exit; fi && cd /tmp/ && touch opentictactoex_installer.making && rm opentictactoex_installer* && wget https://can202.github.io/OpenTicTacToeX/linux/opentictactoex_installer && chmod a+x opentictactoex_installer* && ./opentictactoex_installer*
~~~
