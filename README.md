# Hitnet API 

APIs to be used along with the frontend website and the worker function.

## Complete Setup 
### Download the required nginx modules and compile with nginx 1.10 
Postgres api module does not with latest nginx

1. Download modules inside a parent folder and extract 
 wget http://nginx.org/download/nginx-1.10.3.tar.gz
 wget https://github.com/FRiCKLE/ngx_postgres/archive/1.0rc7.zip
 wget https://github.com/openresty/rds-json-nginx-module/archive/v0.15.zip
 wget https://github.com/calio/form-input-nginx-module/archive/v0.12.zip
 wget https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.zip

2. cd into nginx folder and run the below command
```
./configure --prefix=/opt/nginx --add-module=../rds-json-nginx-module-0.15 --add-module=../ngx_postgres-1.0rc7             --add-module=../ngx_devel_kit-0.3.0  --add-module=../form-input-nginx-module-0.12    --with-http_dav_module

make -j2
make install
```

### Setup  Postgres 
```
yum install postgresql
```

1. Create user credentials which will be used by nginx 
2. Update the postgres pg_hba.conf file
```
Add rule to allow password access on localhost
host    all     all             127.0.0.01/32       password
```
3. Create database inside postgres
.\database-setup\hitnetsql.sql 
4. (Not required) Load Dummy data
.\database-setup\dummy-data.sql
5. Create function in Postgres for url decode
.\database-setup\postgres-url-decode-function.sql
