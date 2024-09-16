.PHONY: clean doctor serve serve-production build

clean:
	bundle exec jekyll clean

doctor:
	bundle exec jekyll doctor

serve:
	JEKYLL_ENV=development bundle exec jekyll serve --livereload --baseurl=

serve-production:
	JEKYLL_ENV=production bundle exec jekyll serve --livereload --baseurl=

build:
	JEKYLL_ENV=production bundle exec jekyll build
