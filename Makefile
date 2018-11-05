export DEFAULT_HELP_TARGET ?= help
export HELP_FILTER ?= app|compose|help|init|docker|completion

export BUILD_HARNESS_BRANCH ?= 0.14.5
-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

-include tasks/Makefile.*

