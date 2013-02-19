require_relative 'pit'

class Fluent::ConfigPitInput < Fluent::Input
  attr_accessor :plugin

  Fluent::Plugin.register_input('config_pit', self)

  def mark_used(conf)
    conf.used = conf.keys
    conf.elements.each{|e| mark_used(e)}
  end

  def configure(conf)
    super

    configs = conf.elements.select {|e| e.name == 'pit' }
    if configs.size != 1
      raise Fluent::ConfigError, "config_pit needs just one <pit ...> ... </pit> section"
    end

    Fluent::Config::Pit.extract(configs.first).tap do |c|
      @plugin = Fluent::Plugin.new_input(c['type'])
      @plugin.configure(c)
    end

    mark_used(configs.first)
  end

  def start
    @plugin.start
  end

  def shutdown
    @plugin.shutdown
  end
end
