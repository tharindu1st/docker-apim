server {
       listen 443;
       ssl on;
       server_name "gateway.developer.abc.com";
       ssl_certificate /etc/nginx/ssl/nginx.crt;
       ssl_certificate_key /etc/nginx/ssl/nginx.key;
       ssl_client_certificate /etc/nginx/ssl/client.cert;
       access_log /etc/nginx/log/developer.abc.com/https/gateway-access.log;
       error_log /etc/nginx/log/developer.abc.com/https/gateway-error.log;

       location /{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_pass https://gateway:8243/t/abc.com/;
       }
}
