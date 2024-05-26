require "sinatra"
require "sinatra/reloader"
require "json"
require "http"

get("/") do
  erb(:home_page)
end

post("/astronomy_pic") do
  
  nasa_url = "https://api.nasa.gov/planetary/apod?api_key=#{ENV["NASA_KEY"]}"
  erb(:process_form)
end
