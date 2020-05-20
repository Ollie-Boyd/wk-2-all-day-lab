require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../drink.rb')

class TestDrink < Minitest::Test

    def test_drink_has_name
        drink = Drink.new("Carlsberg", 300)
        assert_equal("Carlsberg", drink.name)
    end

     def test_drink_has_price
         drink = Drink.new("Carlsberg", 300)
         assert_equal(300, drink.price)
     end

end