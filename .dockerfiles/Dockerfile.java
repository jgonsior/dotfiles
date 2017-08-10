# vi: ft=dockerfile

FROM base/archlinux
RUN pacman-db-upgrade
RUN pacman -Syyu --noconfirm && pacman --noconfirm -S jdk8-openjdk maven
WORKDIR /code
# CMD python
