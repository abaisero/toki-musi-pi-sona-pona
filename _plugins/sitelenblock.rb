# frozen_string_literal: true

require_relative 'tk'

module Jekyll
  # Liquid tag block for sitelen glyphs
  class SitelenTagBlock < Liquid::Block
    def render(context)
      text = super

      lines = text.lines(chomp: true)
      outputs = lines.map do |line|
        line = TK.indent line
        TK.process line
      end

      outputs.join("\n")
    end
  end
end

Liquid::Template.register_tag 'sitelenblock', Jekyll::SitelenTagBlock
