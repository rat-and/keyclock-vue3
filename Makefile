CURR_PATH = $(shell pwd)
APP_NAME = $(shell echo "keycloak-vue3")

######### Development Environment #########
.PHONY: build-dev-env run-dev-env run-dev-env-it down-dev-env

# Build DEV instance (image)
build-dev-env:
	@docker-compose \
 		--file docker-compose.yml \
 		--project-name $(APP_NAME) \
 		build
	@docker-compose \
		--file docker-compose.yml run \
		--rm \
		--no-deps \
		$(APP_NAME) \
		sh -c 'npm install'
	@echo "[DEV-INFO] DEV instance(s) image(s) were successfully built!"

# Run DEV instance
run-dev-env:
	@docker-compose \
		--file docker-compose.yml up \
		--detach \
		$(APP_NAME)
	@echo "[DEV-INFO] DEV instance(s) were successfully started! Webpack launch may take a while...."

# Run DEV instance interactive
run-dev-env-it:
	@docker-compose \
		--file docker-compose.yml run \
		--rm \
		$(APP_NAME) \
		sh -c '/bin/sh'

# Stop and clear DEV instance
down-dev-env:
	@docker-compose \
		--file docker-compose.yml \
 		down --remove-orphans
	@echo "[DEV-INFO] DEV instances were successfully stopped."
