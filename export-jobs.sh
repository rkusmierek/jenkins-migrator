BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-src

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

RUN="java -jar jenkins-cli-src.jar -s ${JENKINS_URL}"
CURL_AUTH="-u ${JENKINS_USER}:${JENKINS_PASS}"

${RUN} list-jobs ${AUTH} | dos2unix > jobs.txt

cat jobs.txt | while read JOB
do
    JOB_CODE=`echo ${JOB} | sed 's| |%20|g' `
	echo Exporting job: ${JOB}
	curl ${CURL_AUTH} "${JENKINS_URL}/job/${JOB_CODE}/config.xml" 2>/dev/null > "jobs/${JOB}.xml"
	echo
done
