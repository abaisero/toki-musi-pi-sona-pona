# frozen_string_literal: true

# TK module
module TK
  def self.wrap(tagclass, content)
    "<span class='#{tagclass}'>#{content}</span>"
  end

  def self.process(text)
    text = text.gsub(/\((?<glyph>[^)]*)\)/) { |match| wrap('sitelen-glyph', match[1...-1]) }
    text = text.gsub(/\{(?<glyph>[^}]*)\}/) { |match| wrap('sitelen-glyph-reverse', match[1...-1]) }
    text = text.gsub(/&(amp;)?\s*/) { |match| wrap('sitelen-joiner', match) }
    text = text.gsub(/,\s*/) { |match| wrap('latin-comma', match) }
    text = text.gsub(/\.\s*/) { |match| wrap('latin-period', match) }
    text.gsub(/\?\s*/) { |match| wrap('latin-qmark', match) }
  end

  def self.indent(input)
    line = nil

    segments = input.strip.split(/>\s+/)
    segments.map.with_index do |segment, i|
      if i.zero?
        line = segment
        next segment
      end

      anchor = segment[/\w+/]
      indent, = line.partition(/\b#{anchor}\b/)
      line = "#{indent}#{segment}"

      wrapped_indent = wrap 'indent', indent
      "<br>#{wrapped_indent}#{segment}"
    end.join
  end
end
