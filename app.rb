require("bundler/setup")
Bundler.require(:default)
require('pry')


get("/") do
  erb(:index)
end
