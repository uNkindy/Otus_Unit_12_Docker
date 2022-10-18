FROM alpine
RUN apk update  && apk upgrade && apk add nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/
EXPOSE 90
CMD [ "nginx", "-g", "daemon off;" ]
