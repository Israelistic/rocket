require "minitest/autorun"
require_relative "rocket"
require 'minitest/pride'
class RocketTest < Minitest::Test
  # Write your tests here!
  #arrange
  #act
  #assert
  def test_rocket_creates_with_attributes
     #arrange
     #act
     rocket = Rocket.new({name: "rocky", colour: "blue", flying: true})
     #assert
     assert_equal(true, rocket.flying?)
     assert_equal("rocky", rocket.name)
     assert_equal("blue", rocket.colour)
    end
    def test_rocket_default_attributes
      rocket = Rocket.new
      assert_equal(false, rocket.flying?)
      assert_equal(rocket.name.is_a?(String), true)
      assert_equal(rocket.colour.is_a?(String), true)

    end

    def test_flying_rocket_gives_status
      #arrange
        rocket = Rocket.new(name: "aries", flying: true)
        #act
        results  = rocket.status
        #assert
        assert_equal(results,  "Rocket aries is flying through the sky!" )

    end
    def test_non_flying_rocket_gives_status
      #arrange
      rocket = Rocket.new(name:"IKAROS", flying: false)
      #act
      results = rocket.status
      #assert
      assert_equal(results, "Rocket IKAROS is ready for lift off!")
    end
    def test_if_the_rocket_has_landed
      #arrange
      rocket = Rocket.new(flying: true)
      #act
      results = rocket.land
      #assert
      assert_equal(results, true )
      assert_equal(rocket.flying?, false)
    end
    def test_if_rocket_on_the_ground
      #arrange
      rocket = Rocket.new
      #act
      results  = rocket.land
      #assert
      refute(results, false )
    end
    def test_if_the_non_flying_rocket_is_ready_to_fly
      #arrange
      rocket = Rocket.new
      #act
      results = rocket.lift_off
      #assert
      assert_equal(results, true)
      assert_equal(rocket.flying?, true)
    end
    def test_if_flying_rocket_can_lift_off
      #arrange
      rocket = Rocket.new(flying: true)
      #act
      results = rocket.lift_off
      #assert
      assert_equal(results, false)
    end
end
