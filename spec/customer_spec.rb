require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')



class TestCustomer < Minitest::Test
    def setup()
        @customer1 = Customer.new("Jack", 500, 18, 0)
        @customer2 = Customer.new("Ollie", 1000, 14, 0)
        @customer3 = Customer.new("Ronan", 1500, 88, 0)
        @drink1 = Drink.new(:Carlsberg, 500, 3)
        @drink2 = Drink.new(:Strongbow, 800, 4)
        @drink3 = Drink.new(:Guinness, 1000, 5)
        @drink4 = Drink.new(:Tennents_Super, 800, 4)
        @pub = Pub.new("The Winchester", 10000, [@drink1, @drink2, @drink3, @drink4])


    end

   
    def test_customer_has_name()
        assert_equal("Jack", @customer1.name())
    end
    def test_customer_has_money()
        assert_equal(1500, @customer3.wallet())
    end

    def test_customer_has_age()
        assert_equal(18, @customer1.age())
    end

    def test_customer_has_alcohol_level()
        assert_equal(0, @customer3.alcohol_units())
    end

    def test_customer_increase_alcohol_level()
        alcohol = @pub.get_alcohol_units_of_drink_by_name(:Strongbow)
        @customer3.increase_alcohol_units(alcohol)
        assert_equal(4, @customer3.alcohol_units())
    end


    def test_reduce_money()
        @customer1.take_from_wallet(500)
        assert_equal(0, @customer1.wallet())

    end
    def test_consume_drink__enough_money()
        @customer3.consume_drink(:Guinness, @pub)
        assert_equal(500, @customer1.wallet())
    end

    def test_consume_drink__not_enough_money()
        @customer1.consume_drink(:Guinness, @pub)
        assert_equal(500, @customer1.wallet())
    end

    def test_consume_multiple_drinks()
        @customer3.consume_drink(:Guinness, @pub)
        @customer3.consume_drink(:Carlsberg, @pub)
        assert_equal(0, @customer3.wallet())
    end


end