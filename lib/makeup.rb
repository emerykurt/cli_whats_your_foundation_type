class MakeUp 
    #keeps trach of makeup attributes and saves all the foundations 
    attr_accessor :id, :name, :price, :product_cat, :description
    
    @@all = []
    
    def initialize 
        @@all << self
    end

    def self.all
        @@all
    end

    #id => "id"
    #name of product => "name"
    #price of product => "price"
    #product description => "description"
end 
