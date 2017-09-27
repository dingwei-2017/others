###### This dockerfile used to create a spark image ###### 
# Spark
#
# VERSION 0.0.1


FROM		centos

LABEL		Description="This image is used to start the deploy and start spark services" Vendor="Estuaryapp" Version="1.0"

# Install spark dependances(java > 1.8; scala > 2.1)

#RUN	     	mkdir -p /usr/lib/java; \
#		cd /tmp; \
#		/bin/bash -c `wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-arm64-vfp-hflt.tar.gz`; \
RUN yum check-update; yum install -y wget
#RUN wget http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-arm64-vfp-hflt.tar.gz
RUN	     	mkdir -p /usr/lib/java; \
		cd /tmp; \
		/bin/bash -c `wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-arm64-vfp-hflt.tar.gz`; \
		tar -zxvf jdk-8u144-linux-arm64-vfp-hflt.tar.gz -C /usr/lib/java/; \
		rm -rf jdk-8u144-linux-arm64-vfp-hflt.tar.gz

RUN		mkdir -p /usr/local/spark \
		&& cd /tmp \
		&& wget https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz \
		&& tar -zxvf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local/spark \
		&& rm -rf spark-2.2.0-bin-hadoop2.7.tgz




ENV		JAVA_HOME=/usr/lib/java/jdk1.8.0_144
ENV		PATH=$PATH:$JAVA_HOME/bin



#CMD            	/usr/local/spark/spark-2.2.0-bin-hadoop2.7/sbin/start-all.sh

CMD		/bin/echo "spark install ok"
