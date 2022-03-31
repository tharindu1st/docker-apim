
upstream sslapim.am.wso2.com {
    server apim:9443;
}

server {
    listen 443;
    server_name "developer.abc.com";
    proxy_set_header X-Forwarded-Port 443;
    ssl on;
    ssl_certificate /etc/nginx/ssl/server.crt;
    ssl_certificate_key /etc/nginx/ssl/apim.key;
    access_log /etc/nginx/log/am/https/access.log;
    error_log /etc/nginx/log/am/https/error.log;
    location /publisher {
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/publisher;
               proxy_set_header X-WSO2-Tenant "abc.com";
        }

    location /admin {
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/admin;
               proxy_set_header X-WSO2-Tenant "abc.com";
        }

       location /devportal{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/devportal;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }
        location /carbon{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/carbon;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }
       location /api/am/devportal/v2{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/api/am/devportal/v2;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }

       location /api/am/admin/v3{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/api/am/admin/v3;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }
       location /api/am/publisher/v3{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/api/am/publisher/v3;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }
       location /authenticationendpoint{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/authenticationendpoint;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }
       location /oauth2{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/oauth2;
       }

       location /logincontext{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/logincontext;
       }
       location /commonauth{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/commonauth;
       }
       location /oidc{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/oidc;
       }
       location /client-registration/v0.17{
               proxy_set_header X-Forwarded-Host $host;
               proxy_set_header X-Forwarded-Server $host;
               proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
               proxy_set_header Host $http_host;
               proxy_read_timeout 5m;
               proxy_send_timeout 5m;
               proxy_pass https://sslapim.am.wso2.com/client-registration/v0.17;
               proxy_set_header X-WSO2-Tenant "abc.com";
       }


}
