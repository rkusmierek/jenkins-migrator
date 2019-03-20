BASEDIR=$(readlink -f $(dirname "$0") )
ENV_FILE=${BASEDIR}/env-dst

[ -f ${ENV_FILE} ] || {
    echo "Configuration file missing: $ENV_FILE"
    exit 1
}

. $ENV_FILE

sed -i "s|http://javaci.software.altkom.pl:9000|${SONAR_URL}|" jobs/*
sed -i "s|http://javaci.software.altkom.pl:9100|${SONAR_URL}|" jobs/*
sed -i "s|http://javaci.software.altkom.pl:9200|${SONAR_URL}|" jobs/*
sed -i "s|-Dsonar.login=[^ ]*|-Dsonar.login=${SONAR_TOKEN}|" jobs/*