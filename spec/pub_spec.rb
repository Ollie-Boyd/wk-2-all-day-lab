require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')



class TestPub < Minitest::Test
    def setup

        @drink1 = Drink.new(:Carlsberg, 500, 3)
        @drink2 = Drink.new(:Strongbow, 800, 4)
        @drink3 = Drink.new(:Guinness, 1000, 5)
        @drink4 = Drink.new(:Tennents_Super, 800, 4)
        @pub = Pub.new("The Winchester", 10000, [@drink1, @drink2, @drink3, @drink4])
        @customer1 = Customer.new("Jack", 500, 18, 0)
        @customer2 = Customer.new("Ollie", 1000, 14, 0)
        @customer3 = Customer.new("Ronan", 1500, 88, 0)

    end

    def test_pub_has_name()
        assert_equal("The Winchester", @pub.name())
    end

    def test_pub_has_drinks
        assert_equal({:Carlsberg=>{:price=>500, :alcohol_units=>3}, :Strongbow=>{:price=>800, :alcohol_units=>4}, :Guinness=>{:price=>1000, :alcohol_units=>5}, :Tennents_Super=>{:price=>800, :alcohol_units=>4}}, @pub.drinks)
    end

    def test_increase_till_balance
        @pub.increase_till_balance(500)
        assert_equal(10500, @pub.till)
    end

    def test_remove_drink_by_name
        @pub.remove_drink_by_name(:Guinness)
        assert_equal({:Carlsberg=>{:price=>500, :alcohol_units=>3}, :Strongbow=>{:price=>800, :alcohol_units=>4}, :Tennents_Super=>{:price=>800, :alcohol_units=>4}}, @pub.drinks)
    end

    def test_get_price_of_drink_by_name
        assert_equal(1000, @pub.get_price_of_drink_by_name(:Guinness))
    end

    def test_get_alcohol_units_of_drink_by_name
        assert_equal(4, @pub.get_alcohol_units_of_drink_by_name(:Strongbow))
    end

    def test_make_purchase
        age = @customer1.age
        @pub.make_purchase(:Guinness, age)
        assert_equal({:Carlsberg=>{:price=>500, :alcohol_units=>3}, :Strongbow=>{:price=>800, :alcohol_units=>4}, :Tennents_Super=>{:price=>800, :alcohol_units=>4}}, @pub.drinks)
        assert_equal(11000, @pub.till)
   
    end

    def test_age_check__old_enough
        age = @customer1.age
        assert_equal(true, @pub.age_check(age))
    end
     
    

    def test_age_check__underage
        age = @customer2.age
        assert_equal(false, @pub.age_check(age))
    end

    

end