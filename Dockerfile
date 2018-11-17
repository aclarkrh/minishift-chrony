FROM rhel7/rhel

RUN yum -y update && \
    yum -y install chrony

CMD (chronyd -n -m -s -l /dev/stdout)