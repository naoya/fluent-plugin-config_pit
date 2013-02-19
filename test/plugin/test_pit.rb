require 'helper'

class ConfigPitTest < Test::Unit::TestCase
  def setup
    Pit.set("test", :data => {"user" => "fiorung", "password" => "xenoblade" })
    @module = Fluent::Config::Pit
  end

  def test_extract
    attrs = {
      'tag' => 'mytag',
      'user' => '$pit[user]',
      'password' => '$pit[password]'
    }
    conf = @module.extract Fluent::Config::Element.new('pit', 'test', attrs, [])

    assert_equal conf['tag'], 'mytag'
    assert_equal conf['user'], 'fiorung'
    assert_equal conf['password'], 'xenoblade'
  end
end
