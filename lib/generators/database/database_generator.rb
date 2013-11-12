class DatabaseGenerator < Rails::Generators::ModelGenerator
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"

  check_class_collision


end
