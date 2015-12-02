###========================================================================
### File: docker.mk
###
### Author(s): Enrique Fernandez <efcasado@gmail.com>
###========================================================================
.PHONY: dkr-build dkr-run dkr-info


## Settings
##-------------------------------------------------------------------------
ifndef DKR_IMAGE
$(error DKR_IMAGE is not set)
endif

DKR_DOCKER     ?= $(shell which docker)
DKR_DOCKERFILE ?= .
DKR_IMAGE_VSN  ?= $(shell git describe --tags 2> /dev/null || echo dev)
DKR_BUILD_OPTS ?= -t $(DKR_IMAGE):$(DKR_IMAGE_VSN)
DKR_RUN_OPTS   ?= --rm -it
DKR_RUN_CMD    ?= /bin/sh

## Macros
##-------------------------------------------------------------------------
DKR_IMAGE_FULL := $(DKR_IMAGE):$(DKR_IMAGE_VSN)

## Targets
##-------------------------------------------------------------------------
dkr-build: ; $(DKR_DOCKER) build $(DKR_BUILD_OPTS) $(DKR_DOCKERFILE)

dkr-run: ; $(DKR_DOCKER) run $(DKR_RUN_OPTS) $(DKR_IMAGE_FULL) $(DKR_RUN_CMD)

dkr-info:
	@echo "[info] docker.mk: DKR_DOCKER     = $(DKR_DOCKER)"
	@echo "[info] docker.mk: DKR_DOCKERFILE = $(DKR_DOCKERFILE)"
	@echo "[info] docker.mk: DKR_IMAGE      = $(DKR_IMAGE)"
	@echo "[info] docker.mk: DKR_IMAGE_VSN  = $(DKR_IMAGE_VSN)"
	@echo "[info] docker.mk: DKR_BUILD_OPTS = $(DKR_BUILD_OPTS)"
	@echo "[info] docker.mk: DKR_RUN_OPTS   = $(DKR_RUN_OPTS)"
	@echo "[info] docker.mk: DKR_RUN_CMD    = $(DKR_RUN_CMD)"
