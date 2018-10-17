#!/bin/bash
set -e

echo "Validating CloudFormation templates"
for filename in templates/*.yaml; do
    echo "Validating $filename..."
    aws cloudformation validate-template --template-body file://$filename
    echo ""
    echo ""
done

echo "Validating JSON Config files"
for filename in config/*.json; do
    echo "Validating $filename..."
    npx jsonlint -q $filename
    echo ""
    echo ""
done