BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-dst

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

sed -i "s|<artifactoryName>.*</artifactoryName>|<artifactoryName>${ARTIFACTORY_NAME}</artifactoryName>|" jobs/*
sed -i "s|<artifactoryUrl>http://javaci.software.altkom.pl:8081</artifactoryUrl>|<artifactoryUrl>${ARTIFACTORY_URL}</artifactoryUrl>|" jobs/*