build:
	GOOS=linux go build

pack: build
	docker build -t sdomula/hello:$(TAG) .

upload:
	docker push sdomula/hello:$(TAG)

deploy-dev:
	helm upgrade --install hello-dev deploy/chart/hello --namespace develop --set tag=$(TAG),stage=dev

deploy-canary:
	helm upgrade --install hello-canary deploy/chart/hello --namespace default --set tag=$(TAG),service.enabled=false,replicas=1,stage=canary

deploy-prod:
	helm upgrade --install hello deploy/chart/hello --namespace default --set tag=$(TAG),service.port=32000,replicas=5,stage=prod
