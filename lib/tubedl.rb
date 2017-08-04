require_relative 'tubedl/version'
require_relative 'tubedl/playlist_parser.rb'
require_relative 'tubedl/youtube_video.rb'
require 'nokogiri'
require 'open-uri'
require 'awesome_print'


module Tubedl
  include PlaylistParser
  include YoutubeVideo
end
