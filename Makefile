.DEFAULT_GOAL := help

help: ## Print this message
	@echo  "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sort | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\x1b[36m\1\x1b[m:\2/' | column -c2 -t -s :)"

presentation: ## Start the presentation web server
	@docker run --rm -p 1948:1948 -p 35729:35729 -v $(shell pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --watch --highlight-theme a11y-dark
.PHONY: presentation

presentation-w-notes: ## Start the presentation web server
	@docker run --rm -p 1948:1948 -p 35729:35729 -v $(shell pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --scripts print-format.js --watch
.PHONY: presentation-w-notes

export-pdf: clean ## Export presentation to pdf
	@mv Presentation/print-options.json Presentation/reveal.json
	@docker run -d -p 1948:1948 -v $(shell pwd)/Presentation:/slides --name reveal-md webpronl/reveal-md:latest /slides
	@mkdir generation_tmp && sudo chmod 777 generation_tmp
	@sleep 5
	@docker run --rm -t --net=host -v $(shell pwd)/generation_tmp:/slides astefanutti/decktape reveal http://localhost:1948/slides.md slides.pdf
	@mv -f generation_tmp/slides.pdf Presentation/doc/slides.pdf
	@make clean
	@mv Presentation/reveal.json Presentation/print-options.json
.PHONY: export-pdf

prepare:
	@npm install @semantic-release/exec -D
	@npm install @semantic-release/changelog -D
	@npm install @semantic-release/git -D
.PHONY: prepare

clean: ## Clean docker image
	@docker stop reveal-md || true
	@docker rm reveal-md || true
	@rm -rf generation_tmp || true
.PHONY: clean
