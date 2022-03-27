.DEFAULT_GOAL := help

help: ## Print this message
	@echo  "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sort | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\x1b[36m\1\x1b[m:\2/' | column -c2 -t -s :)"

.PHONY: presentation
presentation: ## Start the presentation web server
	@docker run --rm -p 1948:1948 -p 35729:35729 -v $(shell pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --watch

.PHONY: export-pdf
export-pdf: clean ## Export presentation to pdf
	@docker run -d -p 1948:1948 -v $(shell pwd)/Presentation:/slides --name reveal-md webpronl/reveal-md:latest /slides
	@sleep 5s
	@docker run --rm -t --net=host -v $(shell pwd)/Presentation/doc:/slides astefanutti/decktape reveal http://localhost:1948/slides.md slides.pdf
	@make clean

.PHONY: presentation-expose
presentation-expose: clean ## Export presentation to pdf
	@docker run -d -p 1948:1948 -v $(shell pwd)/Presentation:/slides --name reveal-md webpronl/reveal-md:latest /slides
	@sleep 5s

.PHONY: clean
clean: ## Clean docker image
	@docker stop reveal-md || true
	@docker rm reveal-md || true
