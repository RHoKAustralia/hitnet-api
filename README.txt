to install nginx 
----
./configure --prefix=/opt/nginx-new --add-module=../rds-json-nginx-module-0.15 --add-module=../ngx_postgres-1.0rc7  \
           --add-module=../ngx_devel_kit-0.3.0  --add-module=../form-input-nginx-module-0.12 \
		   --with-http_dav_module
            
            make -j2
            make install

----

Need to setup function in Postgres
----
CREATE OR REPLACE FUNCTION url_decode(input text) RETURNS text
LANGUAGE plpgsql IMMUTABLE STRICT AS $$
DECLARE
 bin bytea = '';
 byte text;
BEGIN
 FOR byte IN (select (regexp_matches(input, '(%..|.)', 'g'))[1]) LOOP
   IF length(byte) = 3 THEN
     bin = bin || decode(substring(byte, 2, 2), 'hex');
   ELSE
     bin = bin || byte::bytea;
   END IF;
 END LOOP;
 RETURN convert_from(bin, 'utf8');
END
$$;
----