require 'pry'

class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if price_check(item) == "Item not found"
        resp.write price_check(item)
        resp.status = 400
      else
        resp.write price_check(item)
      end
    else
      resp.write "Route not found."
      resp.status = 404
    end
    resp.finish
  end

  def price_check(item)
    @@items.each do |i|
      if i.name == item

        return "#{i.price}"
      else
       return "Item not found"
      end
    end
  end

end
