#!/usr/bin/env bash

# пуляем изменения с переданной ветки
# $1 какую ветку
cd ../composites/audit-aws/
cd ./stack-audit-aws-cloudtrail/extends/
git checkout -b ${1}
echo "Cloudtrail on ${1} branch"

composites=("cloudwatch" "cloudwatchlogs" "cloudtrail" "config" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
compositeLength=${#composites[@]}
for((i=0; i<${compositeLength}; i++)); do
    cd ../../stack-audit-aws-${composites[i]}/extends
    git checkout -b ${1}
    echo "${composites[i]} on ${1} branch"
done

cd ../../
git checkout -b ${1}
echo "Audit-aws on ${1} branch"

#cd ../audit-aws/
#cd ./stack-audit-aws-cloudtrail/extends/
#git checkout -b ${1}
#echo "Cloudtrail on ${1} branch"
#
#composites=("cloudwatch" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
#for((i=0; i<=8; i++)); do
#    cd ../../stack-audit-aws-${composites[i]}/extends
#    git checkout -b ${1}
#    echo "${composites[i]} on ${1} branch"
#done
#
#cd ../../
#git checkout -b ${1}
#echo "Audit-aws on ${1} branch"

