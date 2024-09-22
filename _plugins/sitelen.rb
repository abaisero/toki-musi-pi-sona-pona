# frozen_string_literal: true

require_relative 'tk'

def dig(object, keys)
  keys.each do |key|
    object = object[key]
  end
  object
end

module Jekyll
  # Liquid tag for sitelen glyphs
  class SitelenTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      # the strip removes excess white spaces on the sides, which messes up the font rendering
      @markup = markup.strip
    end

    def render(context)
      if @markup.match(/^variable: (?<keys>\w+(?:\.\w+)*)$/)
        keys = Regexp.last_match[:keys].split('.')
        text = dig context, keys
      else
        text = @markup
      end

      TK.process text
    end
  end
end

Liquid::Template.register_tag 'sitelen', Jekyll::SitelenTag
