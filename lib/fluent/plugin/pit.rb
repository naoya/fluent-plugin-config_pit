require 'pit'

module Fluent::Config::Pit
  def self.extract(conf)
    pit = Pit.get(conf.arg)
    ex = Fluent::Config::Element.new('', '', conf, [])
    ex.each do |k, v|
      if v =~ /^\$pit\[(.+)\]$/
        ex[k] = pit[$1]
      end
    end
    return ex
  end
end
