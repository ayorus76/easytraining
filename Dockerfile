FROM ubuntu
MAINTAINER ayorus76 "aiolia27@gmail.com"
RUN apt-get update \ 
&& apt-get install -y nginx git
RUN cd /tmp
RUN git clone https://github.com/ayorus76/easytraining.git
COPY index.html /usr/share/nginx/html/index.html 
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf 
COPY 404.html /etc/nginx/conf.d/404.html
EXPOSE 8080
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
WORKDIR /home
