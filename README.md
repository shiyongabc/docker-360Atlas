# docker-360-Atlas
为了方便部署 360 公司的 Atlas，制作了该 Dockerfile。

关于 Atlas
---------------
请访问 https://github.com/Qihoo360/Atlas 进行了解。

使用说明
---------------
公开隐射了两个端口和一个文件，分别如下：
  1. 端口1234，是 Atlas 的 mysql 代理端口；
  2. 端口2345，是 Atlas 的管理端口；
  3. 文件docker-atlas.cnf，是 Atlas 的配置文件，镜像中并没有该文件，需要自行从容器外部进行隐射； 
