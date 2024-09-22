# frozen_string_literal: true

module Jekyll
  # Liquid filter for ternary operations
  module TernaryFilters
    def if(value, true_output, false_output)
      value ? true_output : false_output
    end

    def unless(value, false_output, true_output)
      value ? true_output : false_output
    end
  end
end

Liquid::Template.register_filter(Jekyll::TernaryFilters)
