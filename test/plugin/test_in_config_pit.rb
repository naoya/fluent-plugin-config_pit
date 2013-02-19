require 'helper'

class ConfigPitInputTest < Test::Unit::TestCase
  def setup
    Pit.set("test", :data => {"user" => "fiorung", "password" => "xenoblade" })
    Fluent::Test.setup
  end

  def create_driver(conf, pit_id = 'test')
    Fluent::Test::InputTestDriver.new(Fluent::ConfigPitInput).configure(conf)
  end

  def test_configure
    driver = create_driver %[
      <pit test>
        type  config_pit_test
        tag   pit_test
        user  $pit[user]
        password $pit[password]
      </pit>
    ]

    assert_equal 'Fluent::ConfigPitTestInput', driver.instance.plugin.class.to_s
    assert_equal 'pit_test', driver.instance.plugin.tag
    assert_equal 'fiorung', driver.instance.plugin.user
    assert_equal 'xenoblade', driver.instance.plugin.password
  end
end
