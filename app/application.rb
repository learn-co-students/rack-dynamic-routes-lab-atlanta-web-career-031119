require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path == "/items"
            resp.write "You found the item page!"
        else
            resp.write "Route not found"
            resp.status = 404
        end

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last.capitalize
            if item = @@items.find { |i| i.name == item_name }
                resp.write item.price
                resp.status = 200
            else
                resp.write "Item not found"
                resp.status = 400
            end
            resp.finish
        end
        resp.finish
    end
end
