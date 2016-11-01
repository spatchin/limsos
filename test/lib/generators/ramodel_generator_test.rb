require 'test_helper'
require 'generators/ramodel/ramodel_generator'

class RamodelGeneratorTest < Rails::Generators::TestCase
  tests RamodelGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
