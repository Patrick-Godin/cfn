build:
	sam build --template ./src/generate-url/template.yaml --build-dir ./src/generate-url/build

package:
	tools/package.sh

deploy: 
	aws cloudformation deploy \
	--template-file /mnt/c/Users/patri/Documents/sandbox/cfn/arch/templates/build/main.yaml \
	--stack-name main \
	--capabilities CAPABILITY_IAM

clean:
	aws cloudformation delete-stack --stack-name main
	rm -r arch/templates/build
