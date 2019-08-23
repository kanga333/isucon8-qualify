DOCKER_IMAGE := isucon8

build:
	@docker build -t $(DOCKER_IMAGE) .

up: build
	@docker run --rm \
		-v `pwd`:/var/tmp/work \
		--privileged \
		--name ansible-test \
		-d $(DOCKER_IMAGE)

test-playbook:
	docker exec -w /var/tmp/work ansible-test \
		ansible-playbook -i localhost,portal_web,bench -c local provisioning/bench.yml
