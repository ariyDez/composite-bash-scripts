#!/usr/bin/env bash

# пуляем изменения с переданной ветки
# $1 какую ветку
cd ../composites/audit-aws/
cd ./stack-audit-aws-cloudtrail/extends/
git pull
echo "Cloudtrail pull"

composites=("cloudwatch" "cloudtrail" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
compositeLength=${#composites[@]}
for((i=0; i<${compositeLength}; i++)); do
    cd ../../stack-audit-aws-${composites[i]}/extends
    git pull
    echo "${composites[i]} pull"
done



cd ../../
git pull
echo "Audit aws pull"
