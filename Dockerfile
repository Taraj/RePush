FROM node:alpine
RUN apk add git

WORKDIR /app
ENV PATH "${PATH}:/app"

COPY . .

RUN chmod +x /app/push.sh
RUN chmod +x /app/entrypoint.sh


ENTRYPOINT ["entrypoint.sh"]
CMD ["REPUSH"]