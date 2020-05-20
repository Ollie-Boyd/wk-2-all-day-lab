require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')



class TestCustomer < Minitest::Test
    def setup()
        @customer1 = Customer.new("Jack", 500)
        @customer2 = Customer.new("Ollie", 1000)
        @customer3 = Customer.new("Ronan", 1500)
        @drink1 = Drink.new(:Carlsberg, 500)
        @drink2 = Drink.new(:Strongbow, 800)
        @drink3 = Drink.new(:Guinness, 1000)
        @drink4 = Drink.new(:Tennents_Super, 800)
        @pub = Pub.new("The Winchester", 10000, [@drink1, @drink2, @drink3, @drink4])


    end

   
    def test_customer_has_name()
        assert_equal("Jack", @customer1.name())
    end
    def test_customer_has_money()
        assert_equal(1500, @customer3.wallet())
    end
    def test_reduce_money()
        @customer1.take_from_wallet(500)
        assert_equal(0, @customer1.wallet())

    end
    def test_consume_drink__enough_money()
        @customer2.consume_drink(:Guinness, @pub)
        assert_equal(0, @customer2.wallet())
        assert_equal({:Carlsberg=>500, :Strongbow=>800, :Tennents_Super=>800}, @pub.drinks)
        assert_equal(11000, @pub.till)

    end

    def test_consume_drink__not_enough_money()
        @customer1.consume_drink(:Guinness, @pub)
        assert_equal(500, @customer1.wallet())
        assert_equal({:Carlsberg=>500, :Strongbow=>800, :Guinness=>1000, :Tennents_Super=>800}, @pub.drinks)
        assert_equal(10000, @pub.till)

    end


end