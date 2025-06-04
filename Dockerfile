# Use official node image as the base image
FROM node:lts AS build

# ARG AGRIO_NPM_PAT
ARG BASE_HREF=/
# ENV AGRIO_NPM_PAT=$AGRIO_NPM_PAT

ADD ./package.json /tmp/package.json
ADD ./package-lock.json /tmp/package-lock.json
ADD ./version.js /tmp/version.js
ADD ./src/environments/.env.ts /tmp/src/environments/.env.ts

# ADD ./.npmrc /tmp/.npmrc

RUN cd /tmp && npm ci
RUN mkdir -p /usr/local/app && cp -a /tmp/node_modules /usr/local/app/

WORKDIR /usr/local/app

# Add the source code from the app to the container
COPY ./ /usr/local/app/

# Generate the build of the application
# RUN npx ng build -c production

RUN npx ng build --configuration=production --base-href $BASE_HREF
# ADD ./src/assets/env.template.js /usr/local/app/dist/assets/env.template.js

# Stage 2: Serve app with nginx server
# Use official nginx image as the base image
FROM nginxinc/nginx-unprivileged

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/web-app /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

USER root
RUN mkdir -p /usr/share/nginx/html/assets && \
  chown -R 101:101 /usr/share/nginx/html/assets && \
  chmod -R 755 /usr/share/nginx/html/assets
USER 101

EXPOSE 8080

# When the container starts, replace the env.js with values from environment variables
CMD ["/bin/sh", "-c", "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
