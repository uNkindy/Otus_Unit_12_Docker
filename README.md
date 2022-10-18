### Домашнее задание №12 (Docker)
#### 1. Для сборки кастомного образа nginx на базе alpine написан следующий [Dockerfile](https://github.com/uNkindy/Otus_Unit_12_Docker/blob/main/Dockerfile):
```console
FROM alpine                                         -   скачиваем базовый образ alpinel;
RUN apk update  && apk upgrade && apk add nginx     -   обновляем образ alpine и ставим пакет nginx;
RUN rm /etc/nginx/nginx.conf                        -   удаляем дефолтный конфигурационный файл nginx.conf;
COPY nginx.conf /etc/nginx/nginx.conf               -   копируем кастомный конф. файл nginx.conf, меняем listening с 80 на 90;
COPY index.html /usr/share/nginx/html/              -   копируем кастомную дефолтную страницу index.html;
EXPOSE 90                                           -   прокидываем 90 порт из контейнера;
CMD [ "nginx", "-g", "daemon off;" ]                -   запускаем nginx c параметрами -g и daemon off.
```
Файлы [nginx.conf]() и [index.html](https://github.com/uNkindy/Otus_Unit_12_Docker/blob/main/index.html) прилагаются.

#### 2. Билдим образ otus из докерфайла:
```console
[kita@devops Docker]$ sudo docker build . -t otus
Sending build context to Docker daemon  6.144kB
Step 1/7 : FROM alpine
 ---> 9c6f07244728
Step 2/7 : RUN apk update  && apk upgrade && apk add nginx
 ---> Using cache
 ---> c1e09c64c924
Step 3/7 : RUN rm /etc/nginx/nginx.conf
 ---> Using cache
 ---> ef90e7c3d246
Step 4/7 : COPY nginx.conf /etc/nginx/nginx.conf
 ---> 28a46353ee07
Step 5/7 : COPY index.html /usr/share/nginx/html/
 ---> 5b5d0ab77502
Step 6/7 : EXPOSE 90
 ---> Running in a9626282b496
Removing intermediate container a9626282b496
 ---> d35a5091c978
Step 7/7 : CMD [ "nginx", "-g", "daemon off;" ]
 ---> Running in 823a16478357
Removing intermediate container 823a16478357
 ---> 088563a0ed26
Successfully built 088563a0ed26
Successfully tagged otus:latest
```

#### 3. Запускаем кастомный образ:
```console
[kita@devops Docker]$ sudo docker run --name nginx_otus -p 127.0.0.1:90:90 -d otus
85f735c49de04f41b5746555f73af6b8b436e27ff899aeed09adf80125ea5224
```
Проверим статус запущенного контейнера:
```console
[kita@devops Docker]$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES
85f735c49de0   otus      "nginx -g 'daemon of…"   6 seconds ago   Up 5 seconds   127.0.0.1:90->90/tcp   nginx_otus
```
Проверим работу nginx:
```console
[kita@devops Docker]$ curl 127.0.0.1:90
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>OTUS HomeWork</title>
  </head>
  <body>
    Привет
  </body>
```
___
#### Ссылка на [докер хаб](https://hub.docker.com/repository/docker/unkindy/otus):
___
#### Ответы на вопросы:
1. Опеределить разницу между контейнером и образом.
Ответ:
2. Можно ли в контейнере собрать ядро?
Ответ:
