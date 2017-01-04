BRANCH = "master"
PATH_BASE = "/go/src/github.com/vidsy"
REPONAME = "go-base"
VERSION = $(shell cat ./VERSION)

build-binary:
	@docker run \
	-v "${CURDIR}":${PATH_BASE}/${REPONAME} \
	-w ${PATH_BASE}/${REPONAME} \
	${GO_BUILDER_IMAGE}

build-image:
	@docker build -t vidsyhq/${REPONAME} .

check-version:
	@echo "=> Checking if VERSION exists as Git tag..."
	(! git rev-list ${VERSION})

push-tag:
	@echo "=> New tag version: ${VERSION}"
	git checkout ${BRANCH}
	git pull origin ${BRANCH}
	git tag ${VERSION}
	git push origin ${BRANCH} --tags

push-to-registry:
	@docker login -e ${DOCKER_EMAIL} -u ${DOCKER_USER} -p ${DOCKER_PASS}
	@docker tag vidsyhq/${REPONAME}:latest vidsyhq/${REPONAME}:${CIRCLE_TAG}
	@docker push vidsyhq/${REPONAME}:${CIRCLE_TAG}
	@docker push vidsyhq/${REPONAME}
