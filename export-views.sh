BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-src

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

RUN="java -jar jenkins-cli-src.jar -s ${JENKINS_URL}"
CURL_AUTH="-u ${JENKINS_USER}:${JENKINS_PASS}"

${RUN} list-views ${AUTH} | dos2unix > views.txt

cat views.txt | while read VIEW
do
    VIEW_CODE=`echo ${VIEW} | sed 's| |%20|g' `
	echo Exporting view: ${VIEW}
	curl ${CURL_AUTH} "${JENKINS_URL}/view/${VIEW_CODE}/config.xml" 2>/dev/null > "views/${VIEW}.xml"
	echo
done
