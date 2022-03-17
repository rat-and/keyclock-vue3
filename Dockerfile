ARG DOCKER_ENV

FROM node:16.14-alpine AS base
ENV PATH /app/node_modules/.bin:$PATH
WORKDIR /app
COPY ./app .
RUN npm install

FROM base AS image-version-dev
RUN echo "Configuring image for development... - mind that this is not meant to be used on production!"
ENV NODE_ENV=develop

FROM image-version-${DOCKER_ENV} AS final
RUN echo "Done"