require 'tmpdir'
require 'pathname'

class Pathname
  @@tempname_number = 0
  def self.tempname(base=$0, dir=Dir.tmpdir)
    @@tempname_number += 1
    path = new(dir) + "#{File.basename(base)}.#{$$}.#{@@tempname_number}"
    at_exit do
      path.rmtree if path.exist?
    end
    path
  end
end

dir = Pathname.tempname
dir.mkpath
ENV["HOME"] = dir.to_s

require 'pit'
require 'test/unit'

require 'fluent/test'
require 'fluent/config'

require 'fluent/plugin/pit'
require 'fluent/plugin/in_config_pit'
require 'fluent/plugin/out_config_pit'
require 'plugins'
