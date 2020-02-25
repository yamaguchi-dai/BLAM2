# どのイメージを基にするか
FROM postgres:10
# 作成したユーザの情報
LABEL maintainer="Admin <admin@admin.com>"

# RUN: docker buildするときに実行される
RUN echo "now building..."