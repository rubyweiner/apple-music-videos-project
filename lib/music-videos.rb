require 'pry'
require 'rest-client'
require 'json'

def welcome
  puts "Welcome to the Apple Music Video API!"
end

def get_artist
  puts "Search for an artist:"
  input = gets.chomp
  return input
end

def get_music_vid_titles(artist)
  video_info = RestClient.get("https://itunes.apple.com/search?entity=musicVideo&term=#{artist}")
  video_info_hash = JSON.parse(video_info)
  track_names = []
  video_info_hash["results"].each do |video|
    video.each do |key, value|
      if key == "trackName"
        track_names << video["trackName"]
      end
    end
  end
  return track_names
end

def list_music_vid_titles(video_array)
  counter = 1
  puts "This artist's music videos:"
  video_array.each do |track|
    puts "#{counter}. #{track}"
    counter+=1
  end
end

def return_music_vid_titles(artist)
  video_array = get_music_vid_titles(artist)
  list_music_vid_titles(video_array)
end
