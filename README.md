# RePush
App to automatic push master branch to another repository

## Usage
By default, you need docker to run this aplication. This is example ``docker-compose.yml``
```
version: '3.7'
services:
  repush:
    image: taraj2/repush
    container_name: repush
    environment:
      - SECRET=YOUR_SECRET
      - PORT=8585
      - SOURCE_REPO=https://USERNAME:PASSWORD@github.com/Taraj/in.git
      - TARGET_REPO=https://USERNAME:PASSWORD@github.com/Taraj/out.git
    restart: on-failure
    ports:
      - 8585:8585
```
In your `SOURCE_REPO` you should setup https://developer.github.com/webhooks/ and set `SECRET` and `PORT`(in section `ports` and `environment`)
