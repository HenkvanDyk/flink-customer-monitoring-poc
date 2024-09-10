# this is only needed for plugin which can't be set through the 
# ENABLE_BUILT_IN_PLUGINS

FROM flink:1.17

RUN mkdir -p /opt/flink/plugins/flink-s3-fs-hadoop/ &&\
    mv -v /opt/flink/opt/flink-s3-fs-hadoop-*.jar /opt/flink/plugins/flink-s3-fs-hadoop/ &&\
    chown -R flink:flink /opt/flink/plugins/flink-s3-fs-hadoop

USER flink

CMD exec /usr/share/flink/bin/flink-console.sh ${COMPONENT} ${ARGS}