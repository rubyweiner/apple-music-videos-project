#!/usr/bin/env ruby
require_relative '../lib/music-videos.rb'

welcome
artist = get_artist
return_music_vid_titles(artist)
