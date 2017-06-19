#!/usr/bin/env bash

# пуляем изменения с переданной ветки
# $1 какую ветку
cd ../composites/audit-aws/
cd ./stack-audit-aws-cloudtrail/extends/
git checkout ${1}
echo "Cloudtrail on branch"

composites=("cloudwatch" "cloudwatchlogs" "cloudtrail" "config" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
compositeLength=${#composites[@]}
for((i=0; i<${compositeLength}; i++)); do
    cd ../../stack-audit-aws-${composites[i]}/extends
    git checkout ${1}
    echo "${composites[i]} on branch"
done

cd ../../
git checkout $1
echo "Audit-aws on ${1} branch"


## пуляем изменения с переданной ветки
## $1 какую ветку
#cd ../audit-aws/
#cd ./stack-audit-aws-cloudtrail/extends/
#git co ${1}
#echo "Cloudtrail on branch"
#
#composites=("cloudwatch" "cloudwatchlogs" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns" )
#for((i=0; i<=8; i++)); do
#    cd ../../stack-audit-aws-${composites[i]}/extends
#    git co ${1}
#    echo "${composites[i]} on branch"
#done
#
#cd ../../
#git co $1
#echo "Audit-aws on ${1} branch"