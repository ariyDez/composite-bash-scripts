#!/usr/bin/env bash

# пуляем изменения с переданной ветки
# $1 какую ветку
cd ../audit-aws/
cd ./stack-audit-aws-cloudtrail/extends/
git merge ${1}
echo "Cloudtrail merged ${1} branch"

composites=("cloudwatch" "ec2" "elb" "iam" "kms" "rds" "redshift" "s3" "sns")
compositeLength=${#composites[@]}
for((i=0; i<${compositeLength}; i++)); do
    cd ../../stack-audit-aws-${composites[i]}/extends
    git merge ${1}
    echo "${composites[i]} merged ${1} branch"
done

cd ../../
git merge ${1}
echo "Audit-aws merged ${1} branch"