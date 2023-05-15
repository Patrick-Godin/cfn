#!/bin/bash
mkdir -p arch/templates/build
for template_file in arch/templates/*.yaml; do
  output_file="arch/templates/build/${template_file##*/}"
  aws cloudformation package \
    --template-file "$template_file" \
    --output-template-file "$output_file" \
    --s3-bucket "$BUCKET_NAME"
done