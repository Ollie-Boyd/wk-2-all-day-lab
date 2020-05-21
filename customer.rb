class Customer

    attr_reader :name, :wallet, :age, :alcohol_units
    
    def initialize(name, wallet, age, alcohol_units)
        @name = name
        @wallet = wallet
        @age = age
        @alcohol_units = alcohol_units
    end
    def take_from_wallet(money)
        @wallet -= money

    end

    def increase_alcohol_units(alcohol_units)
        @alcohol_units += alcohol_units
    end


    def consume_drink(drink_name, pub)
        price = pub.get_price_of_drink_by_name(drink_name)
        if price <= @wallet
            pub.make_purchase(drink_name, self)
        end
    end

    def order_confirmed(price, units)
        take_from_wallet(price)
        increase_alcohol_units(units)
    end

end