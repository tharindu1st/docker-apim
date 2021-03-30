server {
       listen 443;
       ssl on;
       server_name "developer.abc.com";
       ssl_certificate /etc/nginx/ssl/nginx.crt;
       ssl_certificate_key /etc/nginx/ssl/nginx.key;
       access_log /etc/nginx/log/developer.abc.com/https/devportal-access.log;
       error_log /etc/nginx/log/developer.abc.com/https/devportal-error.log;
       location /{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://devportal:9443/devportal/;
	           proxy_redirect https://devportal:9443/devportal/ /;
               proxy_set_header X-WSO2-Tenant "abc.com";

       }
       location /api/am/store/v1{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://devportal:9443;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }
       location /oauth2{
                      proxy_set_header X-Forwarded-Host $host;
                      proxy_set_header X-Forwarded-Server $host;
                      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                      proxy_set_header Host $http_host;
                      proxy_read_timeout 5m;
                      proxy_send_timeout 5m;
                      proxy_pass https://devportal:9443/oauth2;
              }
       location /authenticationendpoint{
                             proxy_set_header X-Forwarded-Host $host;
                             proxy_set_header X-Forwarded-Server $host;
                             proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                             proxy_set_header Host $http_host;
                             proxy_read_timeout 5m;
                             proxy_send_timeout 5m;
                             proxy_pass https://devportal:9443/authenticationendpoint;
                     }
       location /logincontext{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://devportal:9443/logincontext;
       }
       location /commonauth{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://devportal:9443/commonauth;
       }
       location /oidc{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://devportal:9443/oidc;
       }

}
