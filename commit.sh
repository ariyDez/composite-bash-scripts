#!/usr/bin/env bash


function commitFunc {
    totalMessage=""
    for message in ${@}; do
        message="${totalMessage} ${message}"
        totalMessage=${message}
    done
    git status
    git add .
    git commit -m "${totalMessage}"
}
cd ../composites/audit-aws/
cd ./stack-audit-aws-cloudtrail/extends/
commitFunc ${1}
echo "Cloudtrail commited"

composites=("cloudwatch" "cloudtrail" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
compositeLength=${#composites[@]}
for((i=0; i<${compositeLength}; i++)); do
    cd ../../stack-audit-aws-${composites[i]}/extends
    commitFunc ${1}
    echo "${composites[i]} commited"
done

cd ../../
commitFunc ${1}
echo "Audit-aws commited"
