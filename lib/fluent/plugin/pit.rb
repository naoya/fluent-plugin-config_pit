require 'pit'

module Fluent::Config::Pit
  def self.extract(orig)
    pit = Pit.get(orig.arg)
    conf = Fluent::Config::Element.new('', '', orig, [])
    conf.each do |k, v|
      if v =~ /^\$pit\[(.+)\]$/
        conf[k] = pit[$1]
      end
    end
    return conf
  end
end
