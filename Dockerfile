FROM nginx:1.21.1
LABEL maintainer Nejib yaakoubi
RUN apt-get update &&\
    apt-get upgrade -y&&\
    apt-get install -y curl &&\
    apt-get install -y git
RUN rm -Rf /usr/share/nginx/html/*
RUN git clone https://github.com/YaakoubiNejib/static-website-example.git
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e  's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
    
