BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-dst

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

RUN="java -jar ${BASEDIR}/jenkins-cli-dst.jar -s ${JENKINS_URL}"

cat jobs.txt | while read JOB
do
	echo Importing job ${JOB}
	${RUN} ${AUTH} create-job "${JOB}" < "${BASEDIR}/jobs/${JOB}.xml"
done
