FROM tiryoh/ros-desktop-vnc:melodic

ENV DEBIAN_FRONTEND=noninteractive

# Update apt-get mirror to server in japan
RUN perl -p -i.bak -e 's%(deb(?:-src|)\s+)https?://(?!archive\.canonical\.com|security\.ubuntu\.com)[^\s]+%$1http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%' /etc/apt/sources.list 
RUN apt-get update

# Install package
RUN apt install -y bash-completion build-essential curl gnupg2 lsb-release locales git tmux wget nano gedit x11-apps eog

WORKDIR /home/ubuntu/Desktop/works
RUN git clone https://gitlab.com/trcp/introvision.git
