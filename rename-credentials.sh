BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-dst

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

sed -i "s|<credentialsId>.*</credentialsId>|<credentialsId>${CREDENTIALS_ID}</credentialsId>|" jobs/*