# semantic-version-presentation
Presentation of usage of a semantic version management on a dev project

## how to start presentation

you'll need [docker](https://docs.docker.com/get-docker/) :

```shell
docker run --rm -p 1948:1948 -p 35729:35729 -v $(pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --watch
```

or with Makefile:
```shell
make presentation
```

and then go to [`http://localhost:1948/slides.md#/`](http://localhost:1948/slides.md#/)

any help

```shell
make help
```

```text
 Semantic Version presentation
 ================

Usage:
  make <option>

Presentation
  presentation               Start the presentation web server
  presentation-w-notes       Start the presentation web server (with notes)

Documentation
  export-pdf                 Export presentation to pdf (used in GH action)

Misc
  exec-release               Execution of a new release (used in GH action)
  clean                      Clean docker image
  help                       Display this help
```

## contacts

[sylvain LAVAZAIS](mailto:slavazais@pm.me)


