class Fluent::ConfigPitTestInput < Fluent::Input
  Fluent::Plugin.register_input('config_pit_test', self)
  config_param :tag, :string
  config_param :user, :string
  config_param :password, :string
end

class Fluent::ConfigPitTestOutput < Fluent::Output
  Fluent::Plugin.register_output('config_pit_test', self)
  config_param :tag, :string
  config_param :user, :string
  config_param :password, :string
end
