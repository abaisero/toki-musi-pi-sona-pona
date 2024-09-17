# frozen_string_literal: true

module TestPagePlugin
  # This plugin removes the test page from the site when the environment is not development.
  class TestPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      return if Jekyll.env == 'development'

      site.pages.reject! { |page| page.name == 'test.md' }
    end
  end
end
