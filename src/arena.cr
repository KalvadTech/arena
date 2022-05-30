require "kemal"

x = 0
y = 0
grid_size = 5

def check_position(x, y, grid_size)
  if x > grid_size
    return false
  end
  if x < 0 - grid_size
    return false
  end
  if  y > grid_size
    return false
  end
  if y < 0 - grid_size
    return false
  end
  return true
end

get "/" do
  "Hello World!"
end

get "/status" do |env|
  env.response.content_type = "application/json"
  if check_position(x, y, grid_size) == false
     {"error": "You are dead!"}.to_json
  else
    {"x": x, "y": y}.to_json
  end
end

get "/reset" do |env|
  env.response.content_type = "application/json"
  x = 0
  y = 0
  {"x": x, "y": y}.to_json
end

get "/up" do |env|
  env.response.content_type = "application/json"
  y = y + 1
  if check_position(x, y, grid_size) == false
     {"error": "You are dead!"}.to_json
  else
    {"x": x, "y": y}.to_json
  end
end

get "/down" do |env|
  env.response.content_type = "application/json"
  y = y - 1
  if check_position(x, y, grid_size) == false
     {"error": "You are dead!"}.to_json
  else
    {"x": x, "y": y}.to_json
  end
end
get "/right" do |env|
  env.response.content_type = "application/json"
  x = x + 1
  if check_position(x, y, grid_size) == false
     {"error": "You are dead!"}.to_json
  else
    {"x": x, "y": y}.to_json
  end
end

get "/left" do |env|
  env.response.content_type = "application/json"
  x = x - 1
  if check_position(x, y, grid_size) == false
     {"error": "You are dead!"}.to_json
  else
    {"x": x, "y": y}.to_json
  end
end

Kemal.run
