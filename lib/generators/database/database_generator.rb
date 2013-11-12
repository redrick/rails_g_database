require 'rails/generators/named_base'

class DatabaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, :type => :array, :default => [], :banner => 'field[:adapter]["sqlite|pg|mysql"] field[:db]["database_name"] field[:login]["login"] field[:psswd]["password"] field[:host]["host_name"] field[:port]["port_number"]'

  check_class_collision

  def create_config_file
    ["mysql", "pg", "sqlite"].include?(adapter) ? \
    template("#{adapter.to_s}_yml.rb.erb", "config/database_#{file_name}.yml") : \
    raise("Wrong DB adapter chosen, please refer to 'rails g database' for more info")
  end

  # TODO give these a check, so they wont execute if files already exist
  def create_all_dirs
    system "mkdir db_#{file_name}"
    system "touch db_#{file_name}/.keep"
    system "mkdir db_#{file_name}/migrate"
    system "touch db_#{file_name}/migrate/.keep"

    system "mkdir app/models/#{file_name}"
  end

  def create_seeds_file
    template "seeds.rb.erb", "db_#{file_name}/seeds.rb"
  end

  def create_rake_tasks
    template "rake_task.rb.erb", "lib/tasks/database_#{file_name}.rake"
  end

  def create_base_model
    template "base_model.rb.erb", "app/models/#{file_name}/base.rb"
  end

  # TODO write gem for the db into gemfile and run bundle please :)
  # def alter_gemfile
  # end

  private
    attributes_with_defaults = {
      "adapter" => "sqlite", 
      "db"      => "", 
      "login"   => "root", 
      "passwd"  => "", 
      "host"    => "localhost", 
      "port"    => "5432"
    }

    attributes_with_defaults.each do |method_name, default|
      define_method method_name.to_sym do
        may_be_result = (attributes.find { |a| a.index_name.to_s == method_name.to_s })
        (!may_be_result.nil? || may_be_result.is_a?(Rails::Generators::GeneratedAttribute)) ? may_be_result.type.to_s : default
      end
    end
end
