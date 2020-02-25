# どのイメージを基にするか
FROM centos:centos7
# 作成したユーザの情報
LABEL maintainer="Admin <admin@admin.com>"
# RUN: docker buildするときに実行される
RUN echo "now building..."
# 処理構築
RUN  yum -y update
RUN  yum -y install httpd
RUN  yum -y remove php-*
RUN  yum -y install epel-release
RUN  yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN  yum -y install --enablerepo=remi,remi-php73 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt php-pgsql php-zip
RUN  yum -y install yum-utils

COPY --from=composer /usr/bin/composer /usr/bin/composer
#相対パスのみ
COPY ./.conf/httpd.conf /etc/httpd/conf/


# CMD: docker runするときに実行される
CMD echo "now running..."
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
