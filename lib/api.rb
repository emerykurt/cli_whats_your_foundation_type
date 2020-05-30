require 'pry'
require 'json'
class API 
    #makes calls to api

    def self.fetch_makeup

        url = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=fenty"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        upc = JSON.parse(response)
        upc.each do |makeup_cat|
            #initialize a new drink
            makeup_inst = MakeUp.new 
            #assign attributes to id
            makeup_inst.id = makeup_cat["id"]
            makeup_inst.name = makeup_cat["name"]
            makeup_inst.price = makeup_cat["price"]
            makeup_inst.description = makeup_cat["description"]
            makeup_inst.product_cat = makeup_cat["product_type"]
            makeup_inst.product_uniq = makeup_cat["category"]
        end 
    end 
end
