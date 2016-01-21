
Usage:
-------------

Active mode
----
Create container
<pre>
docker run -it -d \
  -p 21:21 \
  -p 20:20 \
  whylu/centos-vsftp
</pre>


Add user
----
attach into container
<pre>
docker attach ${containerId}
</pre>
add a user and set passowrd
<pre>
useradd tester
passwd tester
</pre>


With Passive mode
----
create a config, ex: /opt/docker-test/vsftp/myFtpConfig
<pre>
pasv_address=${your.ip.hostname.is.not.allowed}
pasv_enable=YES
accept_timeout=60
pasv_min_port=65400
pasv_max_port=65410
</pre>

Create container
<pre>
docker run -it -d \
 -v /opt/crawldata:/var/ftp \
 -v /opt/docker-test/vsftp/myFtpConfig:/opt/customizedFtpConfig \
 -p 21:21 \
 -p 65400-65410:65400-65410 \
  whylu/centos-vsftp
</pre>
-v ${any.path.to.mount} >> mount your data into default path </br>
-v ${your.config.file}:/opt/customizedFtpConfig >> mount config to '/opt/customizedFtpConfig' </br>
-p 65400-65410:65400-65410 >> # pasv port should use as config set </br>

