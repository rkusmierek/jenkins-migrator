BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-dst

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

sed -i "s|<jdk>jdk1\.8\..*</jdk>|<jdk>${JDK_NAME}</jdk>|" jobs/*