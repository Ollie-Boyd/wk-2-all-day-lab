require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../drink.rb')

class TestDrink < Minitest::Test

    def setup
        @drink1 = Drink.new(:Carlsberg, 500, 3)
        @drink2 = Drink.new(:Strongbow, 800, 4)
    end

    def test_drink_has_name
        assert_equal(:Carlsberg, @drink1.name)
    end

     def test_drink_has_price
         assert_equal(500, @drink1.price)
     end

     def test_get_drink_units
        assert_equal(3 , @drink1.alcohol_units)
     end

end