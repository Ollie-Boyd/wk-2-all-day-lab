class Pub

    attr_reader :name, :till, :drinks


    def initialize(name, till, drinks = [])
        @name = name
        @till = till
        @drinks = {} 
        for drink in drinks
            values =Hash[:price => drink.price, :alcohol_units => drink.alcohol_units]
            @drinks[drink.name] = values
        end

    end

    def increase_till_balance(amount)
        @till += amount
    end

    def remove_drink_by_name(drink_name)
        @drinks.delete(drink_name)
    end

    def get_price_of_drink_by_name(drink_name)
        return @drinks[drink_name][:price]
    end

    
    def get_alcohol_units_of_drink_by_name(drink_name)
        return @drinks[drink_name][:alcohol_units]
    end

    def make_purchase(drink_name, customer)
        if verify_customer(customer)
            cost = get_price_of_drink_by_name(drink_name)
            units = get_alcohol_units_of_drink_by_name(drink_name)
            increase_till_balance(cost)
            remove_drink_by_name(drink_name)
            customer.order_confirmed(cost, units)
        end
    end

    def age_check(customer)
        return customer.age >= 18
    end

    def drunk_check(customer)
        return customer.alcohol_units < 9
    end
 
    def verify_customer(customer)
        return age_check(customer) && drunk_check(customer)
    end
end