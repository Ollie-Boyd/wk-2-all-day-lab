class Pub

    attr_reader :name, :till, :drinks


    def initialize(name, till, drinks = [])
        @name = name
        @till = till
        @drinks = {} 
        for drink in drinks
            @drinks[drink.name] = drink.price
        end

    end

    def increase_till_balance(amount)
        @till += amount
    end

    def remove_drink_by_name(drink_name)
        @drinks.delete(drink_name)
        #@drinks.reject{ |key, value| key == drink_name}
    end

    #def get_a_drnk

end