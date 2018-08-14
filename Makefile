.PHONY: deploy

deploy/%:
	aws cloudformation deploy --template-file stack.yml --stack-name todobackend-$* --capabilities CAPABILITY_NAMED_IAM \
		--parameter-overrides $$(cat $*.json | jq -r '.Parameters|to_entries[]|.key+"="+.value')