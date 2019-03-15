BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-src

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

RUN="java -jar jenkins-cli-src.jar -s ${JENKINS_URL}"

${RUN} list-plugins | dos2unix > plugins.txt