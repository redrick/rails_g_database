require 'rails/generators/named_base'

class DatabaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, :type => :array, :default => [], :banner => 'field[:db]["sqlite|pg|mysql"] field[:login]["login"] field[:psswd]["password"]'

  check_class_collision

  def create_config_file
    binding.pry
  end




end
