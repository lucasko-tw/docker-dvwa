

### Git Clone
```sh
git clone https://github.com/lucasko-tw/docker-dvwa.git

cd docker-dvwa
```


### RUN mysql Container

```sh
docker run --name dvwa-mysql -e MYSQL_ROOT_PASSWORD=p@ssw0rd -e MYSQL_DATABASE=dvwa  -d mysql
```



### DVWA Container
```
docker build -t dvwa .

docker run --name dvwa-web --link dvwa-mysql:dvwa-mysql -p 80:80  -it -d  dvwa

```

### Show website

1. setup dvwa
[http://localhost/setup.php](http://localhost/setup.php)


2. login to site

[http://localhost/index.php](http://localhost/index.php)

username: admin
password: password
