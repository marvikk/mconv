version: '3'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - '80:3000'
    depends_on:
      - mongo
    environment:
      ROOT_URL: ${APP_ROOT_URL:-http://localhost}
      MONGO_URL: mongodb://mongo:27017/meteor
      PORT: 3000

  mongo:
    image: mongo:latest
    command:
      - --storageEngine=wiredTiger
    volumes:
      - data:/data/db

volumes:
  data: