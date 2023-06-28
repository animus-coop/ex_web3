
default: help

#❓ help: @ Displays this message
help:
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(firstword $(MAKEFILE_LIST))| tr -d '#'  | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

#🔍 check: @ Runs all code verifications
check:
	@${MAKE} lint.ci dialyzer test

#🔍 dialyzer: @ Runs a static code analysis
dialyzer:
	@mix dialyzer --format dialyxir

#🔍 dialyzer.plt: @ Force PLT check also if lock file is unchanged useful when dealing with local deps.
dialyzer.plt:
	@mix dialyzer --force-check

#🔍 lint: @ Runs a code formatter
lint:
	@mix format
	@mix credo --strict

#🔍 lint.ci: @ Strictly runs a code formatter
lint.ci:
	@mix format --check-formatted
	@mix credo --strict

#📖 docs: @ Generates HTML documentation
docs:
	@mix docs

#🧪 test.all: @ Runs all test suites
test.all:
	@MIX_ENV=test mix test

#🧪 test.cover: @ Runs mix tests and generates coverage
test.cover:
	@MIX_ENV=test mix coveralls.html

coverall.post:
	@MIX_ENV=test mix coveralls.post --token ${{ secrets.SECRET_TOKEN }} --branch "main"

#🧪 test.wip: @ Runs test suites that match the wip tag
test.wip:
	@mix test --only wip