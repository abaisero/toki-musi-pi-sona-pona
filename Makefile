.PHONY: clean doctor serve build

clean:
	bundle exec jekyll clean

doctor:
	bundle exec jekyll doctor

serve:
	bundle exec jekyll serve --livereload --baseurl=

build:
	bundle exec jekyll build
