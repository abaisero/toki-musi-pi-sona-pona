# frozen_string_literal: true

def clean(text)
  text = text.gsub(/\((?<glyph>[^)]*)\)/) { |match| match[1...-1] }
  text = text.gsub(/[()]/, '')
  text = text.gsub(/[{}]/, '')
  text.gsub(/&(amp;)?/, '')
end

Jekyll::Hooks.register :fables, :pre_render do |page|
  Jekyll.logger.info 'Fables:', "Initializing #{page.inspect}"

  sitelen = page.data['sitelen']
  Jekyll.logger.debug 'Fables:', "Reading sitelen #{sitelen}"

  title = clean sitelen

  Jekyll.logger.debug 'Fables:', "Writing title #{title}"
  page.data['title'] = title

  Jekyll.logger.debug 'Fables:', "Writing slug #{title}"
  page.data['slug'] = title
end
