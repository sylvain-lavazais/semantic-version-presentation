.DEFAULT_GOAL := help

help: ## Print this message
	@echo  "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sort | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\x1b[36m\1\x1b[m:\2/' | column -c2 -t -s :)"

.PHONY: presentation
presentation: ## Start the presentation web server
	@docker run --rm -p 1948:1948 -p 35729:35729 -v $(pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --watch
