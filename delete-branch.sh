#!/usr/bin/env bash

# пуляем изменения с переданной ветки
# $1 какую ветку
cd ../audit-aws/
cd ./stack-audit-aws-cloudtrail/extends/
git branch -D ${1}
echo "Cloudtrail on branch"

composites=("cloudwatch" "cloudtrail" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
compositeLength=${#composites[@]}
for((i=0; i<${compositeLength}; i++)); do
    cd ../../stack-audit-aws-${composites[i]}/extend
    git branch -D ${1}
    echo "${composites[i]} on branch"
done

cd ../../
#git co $1
#echo "Audit-aws on  branch"

