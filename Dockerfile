FROM nginx:alpine

ARG ENV_NAME
ARG BANNER_COLOR

COPY app/index.html /usr/share/nginx/html/index.html

RUN sed -i "s|__ENV_NAME__|${ENV_NAME}|g; s|__BANNER_COLOR__|${BANNER_COLOR}|g" /usr/share/nginx/html/index.html

EXPOSE 80
