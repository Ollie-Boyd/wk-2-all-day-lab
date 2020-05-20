require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../customer.rb')
require_relative('../drink.rb')


class TestCustomer < Minitest::Test
    def setup()
        @customer1 = Customer.new("Jack", 500)
        @customer2 = Customer.new("Ollie", 1000)
        @customer3 = Customer.new("Ronan", 1500)

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
    def test_consume_drink()
        @customer2.consume_drink(:Guinness)
        assert_equal(0, @customer2.wallet())

    end


end