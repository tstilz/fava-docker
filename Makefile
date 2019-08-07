USER   := tstilz
#PASS   := niolkmklio89
#REG    := itsrv80.nordicsemi.no
NAME   := fava-img
TAG    := $$(git log --pretty=format:'%h' -n 1)
REPO   := ${USER}
IMG    := ${REPO}/${NAME}:${TAG}
LATEST := ${REPO}/${NAME}:latest

echo:
	echo REPO = ${REPO}
	echo IMG = ${IMG}
	echo NAME = ${NAME}
	echo TAG = ${TAG}
	echo ${REPO}/${NAME}:${TAG}

build:
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker tag ${REPO}/${NAME} ${IMG}
	@docker push ${IMG}
	@docker tag ${REPO}/${NAME} ${LATEST}
	@docker push ${LATEST}

login:
	@docker login -u ${USER} -p ${PASS}
