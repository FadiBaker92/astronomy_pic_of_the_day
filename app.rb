require "sinatra"
require "sinatra/reloader"
require "json"
require "http"

get("/") do
  erb(:home_page)
end

post("/astronomy_pic") do  

  nasa_url = "https://api.nasa.gov/planetary/apod?api_key=#{ENV["NASA_KEY"]}"
  raw_result = HTTP.get(nasa_url ).to_s
  parsed_result = JSON.parse(raw_result)
  @title = parsed_result.fetch("title") 
  @explanation = parsed_result.fetch("explanation")
  @pic_url = parsed_result.fetch("url")

  erb(:process_form)
end
