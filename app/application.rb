class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last 
      item = @@items.find do {|item| item.name == item_name}
      
      if item != nil
        resp.write item.price
      else
        resp.write "We don't have that item"
      end

    else
      resp.write "Path Not Found"
    end
    resp.finish
  end

end 