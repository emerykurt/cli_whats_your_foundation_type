class MakeUp 
    #keeps trach of makeup attributes and saves all the foundations 
    attr_accessor :id, :name, :price, :product_cat, :description, :product_uniq
    
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

    def self.select_product(name)
        product = MakeUp.all.find{|prod| prod.product_cat == name}
        puts "#{product.name}"
    end 

    def self.select_product_uniq(name)
        product = MakeUp.all.find{|prod| prod.product_uniq == name}
        puts "#{product.name}"
    end 
end 
