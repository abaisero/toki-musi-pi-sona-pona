# frozen_string_literal: true

LATIN_COMMA = '<span class="latin-comma">,</span>'
LATIN_QMARK = '<span class="latin-qmark">?</span>'

SITELEN_JOINER = '<span class="sitelen-joiner">&</span>'
SITELEN_GLYPH_REVERSE_START = '<span class="sitelen-glyph-reverse-start">{</span>'
SITELEN_GLYPH_REVERSE_END = '<span class="sitelen-glyph-reverse-end">}</span>'
SITELEN_GLYPH_START = '<span class="sitelen-glyph-start">(</span>'
SITELEN_GLYPH_END = '<span class="sitelen-glyph-end">)</span>'

SITELEN_PI_JOINER = '<span class="sitelen-pi-joiner">pi</span>'

def process(text)
  # must come before SITELEN_JOINER
  text.gsub! ',', LATIN_COMMA
  text.gsub! '?', LATIN_QMARK

  text.gsub!(/(?<=\s)pi(?=\s*\(\s*\w+\s*&(amp;)?\s*\w+\s*\))/, SITELEN_PI_JOINER)
  text.gsub!(/&(amp;)?/, SITELEN_JOINER)

  text.gsub!(/\((?<glyph>.*)\)/,
             "<span class=\"sitelen-glyph\">
                #{SITELEN_GLYPH_START}\\k<glyph>#{SITELEN_GLYPH_END}
              </span>")
  text.gsub!(/\{(?<glyph>.*)\}/,
             "<span class=\"sitelen-glyph-reverse\">
                #{SITELEN_GLYPH_REVERSE_START}\\k<glyph>#{SITELEN_GLYPH_REVERSE_END}
              </span>")

  text
end

module Jekyll
  # Liquid tag for sitelen glyphs
  class SitelenTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(_context)
      process @text
    end
  end
end

Liquid::Template.register_tag('sitelen', Jekyll::SitelenTag)

module Jekyll
  # Liquid tag block for sitelen glyphs
  class SitelenTagBlock < Liquid::Block
    def render(context)
      text = super
      process text
    end
  end
end

Liquid::Template.register_tag('sitelenblock', Jekyll::SitelenTagBlock)
