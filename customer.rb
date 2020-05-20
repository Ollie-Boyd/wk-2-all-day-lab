class Customer

    attr_reader :name, :wallet
    
    def initialize(name, wallet)
        @name = name
        @wallet = wallet
    end
    def take_from_wallet(money)
        @wallet -= money

    end

    # def consume_drink


end