require 'jrjackson'

RSpec.configure do |c|
  c.alias_example_to :fit, :focused => true
  c.filter_run :focused => true
  c.run_all_when_everything_filtered = true
end