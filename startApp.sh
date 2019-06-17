#!/bin/sh
export NODE_ENV=$(aws ssm get-parameter --name /production/hapi-project/NODE_ENV --query "Parameter.Value" --region ap-southeast-1 --output text)
export NODE_HOST=$(aws ssm get-parameter --name /production/hapi-project/NODE_HOST --query "Parameter.Value" --region ap-southeast-1 --output text)
export NODE_PORT=$(aws ssm get-parameter --name /production/hapi-project/NODE_PORT --query "Parameter.Value" --region ap-southeast-1 --output text)
export DB_HOST=$(aws ssm get-parameter --name /production/hapi-project/DB_HOST --query "Parameter.Value" --region ap-southeast-1 --output text)
export DB_USER=$(aws ssm get-parameter --name /production/hapi-project/DB_USER --query "Parameter.Value" --region ap-southeast-1 --output text)
export DB_PASS=$(aws ssm get-parameter --name /production/hapi-project/DB_PASS --with-decryption --query "Parameter.Value" --region ap-southeast-1 --output text)
node /myapp/index.js&
exit 0
