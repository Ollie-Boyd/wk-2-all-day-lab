require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')


class TestPub < Minitest::Test
    def setup

        @drink1 = Drink.new(:Carlsberg, 500)
        @drink2 = Drink.new(:Strongbow, 800)
        @drink3 = Drink.new(:Guinness, 1000)
        @drink4 = Drink.new(:Tennents_Super, 800)
        @pub = Pub.new("The Winchester", 10000, [@drink1, @drink2, @drink3, @drink4])

    end

    def test_pub_has_name()
        assert_equal("The Winchester", @pub.name())
    end

    def test_pub_has_drinks
        assert_equal({:Carlsberg=>500, :Strongbow=>800, :Guinness=>1000, :Tennents_Super=>800}, @pub.drinks)
    end

    def test_increase_till_balance
        @pub.increase_till_balance(500)
        assert_equal(10500, @pub.till)
    end

    def test_remove_drink_by_name
        @pub.remove_drink_by_name(:Guinness)
        assert_equal({:Carlsberg=>500, :Strongbow=>800, :Tennents_Super=>800}, @pub.drinks)

    end

     

 #   def test_can_sell_drink
    

    

end