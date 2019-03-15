BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-dst

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

RUN="java -jar ${BASEDIR}/jenkins-cli-dst.jar -s ${JENKINS_URL}"

cat views.txt | while read VIEW
do
	echo Importing view ${VIEW}
	${RUN} ${AUTH} create-view "${VIEW}" < "${BASEDIR}/views/${VIEW}.xml"
done
