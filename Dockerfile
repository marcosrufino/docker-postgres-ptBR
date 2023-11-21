FROM postgres:9.6
LABEL authors="Marcos Rufino"
#https://docs.oracle.com/cd/E14004_01/books/SiebInstUNIX/SiebInstCOM_Requirements17.html
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
# Define variável de ambiente
ENV LANG pt_BR.UTF-8
