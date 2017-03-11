ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Prints a set of expression/value pairs to the console, enclosed in a debug box to visually separate them from surrounding output, with the code location from which the method was called. The actual code of the expressions themselves are printed, paired with the resultant values of the expressions.
  def ce(*values)
    location = Helpers.get_call_location
    expressions = Helpers.get_expression_info(values, location[:file], location[:line])
    expressions = expressions.collect do |expression|
      name, value = expression
      "  #{name} = #{value}"
    end

    location = Helpers.format_code_location(location[:file], location[:method], location[:line])

    # Get the maximum length of the data.
    max_length = expressions.collect { |expression| expression.length }.max
    length = [[max_length, location.length].max, 75].min

    # Output the data.
    Helpers.output('-' * 75)
    Helpers.output(location)
    Helpers.output
    expressions.each { |expression| Helpers.output(expression) }
    Helpers.output('-' * 75)
    Helpers.output
    values.size == 1 ? values.first : values
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
