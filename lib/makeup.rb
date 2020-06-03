class MakeUp 
    #keeps trach of makeup attributes and saves all the foundations 
    attr_accessor :product_id, :name, :price, :product_cat, :description, :product_uniq
    
    @@all = []
    
    def initialize
        # @price = price
        @@all << self
    end

    def self.all
        @@all
    end

    #id => "id"
    #name of product => "name"
    #price of product => "price"
    #product description => "description"

    # def whatever
    #   puts "price"
    # end

    def self.select_product(name)
        product = MakeUp.all.find{|prod| prod.product_cat == name}
        puts "#{product.name}"
    end 

    def self.select_product_uniq(name)
        item = MakeUp.all.find{|prod| prod.product_uniq == name}
        puts "#{item.name}"
    end 

    def self.select_product_info(name)
        product_info = MakeUp.all.find{|prod| prod.product_cat == name}
        puts "#{product_info.description}"
    end 

    def self.select_product_uniq_info(name)
        item_info = MakeUp.all.find{|prod| prod.product_uniq == name}
        puts "#{item_info.description}"
    end

    def self.select_found(name)
        selection = MakeUp.all.find{|prod| prod.product_id == name}
        puts "#{selection.name}"
    end 

    def self.select_found_info(name)
        selection_info = MakeUp.all.find{|prod| prod.product_id == name}
        puts "#{selection_info.description}"
    end 
end 
