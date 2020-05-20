require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../drink.rb')

class TestDrink < Minitest::Test

    def test_drink_has_name
        drink = Drink.new("Carlsberg")
        assert_equal("Carlsberg", drink.name)
    end

end