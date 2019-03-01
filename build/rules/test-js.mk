##
## JavaScript Tests
##--------------------------------------

# bin file definitions
KARMA=$(NODE_PREFIX)/node_modules/.bin/karma
JSHINT=$(NODE_PREFIX)/node_modules/.bin/jshint

.PHONY: test-syntax-js
test-syntax-js: ## Run JS syntax checks
test-syntax-js: $(JSHINT)
	-$(JSHINT) --config .jshintrc --exclude-path .gitignore js tests/js

.PHONY: test-js
test-js: ## Run JS test suites (single run)
test-js: $(js_deps) $(KARMA) test-syntax-js
	$(KARMA) start tests/js/karma.config.js --single-run

test-js-debug: ## Run JS test suites and watch for changes
test-js-debug: $(js_deps) $(KARMA) test-syntax-js
	$(KARMA) start tests/js/karma.config.js

$(KARMA): $(nodejs_deps)
$(JSHINT): $(nodejs_deps)

#
# Dependency management
#--------------------------------------
