FROM node:20-alpine

WORKDIR /app

RUN addgroup -S app && adduser -S app -G app

COPY --chown=app:app package*.json ./

RUN npm install

COPY --chown=app:app . .

RUN npm run build

RUN chown -R app:app /app

USER app

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://127.0.0.1:8080 || exit 1

CMD ["npm", "run", "serve"]