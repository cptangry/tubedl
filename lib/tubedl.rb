require_relative 'tubedl/version'
require_relative 'tubedl/playlist_parser'
require 'nokogiri'
require 'open-uri'
require 'yaml'

module Tubedl
  include PlaylistParser

	QULITIES = {
		hd1440: '?version=3&vq=hd1440',
		hd1080: '?version=3&vq=hd1080',
		hd720:  '?version=3&vq=hd720',
		sd480:  '?version=3&vq=large',
		sd360:  '?version=3&vq=medium',
		sd240:  '?version=3&vq=small'
	}

  def self.get_videoID(link)
    link.match(PlaylistParser::YoutubeRegex)[5]
  end

  def self.set_quality(str, quality)
  	str + QULITIES[quality.to_sym]
	end

	def self.get_page_data(url)
		begin
			doc = Nokogiri::HTML(open(url).read)
		rescue Timeout::Error
			STDERR.puts "Timeout while connecting to: #{urlHash}"
			STDERR.puts 'Retrying...'
			retry
		end
		doc
	end

	def self.load_playlist(file_path)
		YAML.load_file(file_path)
	end

	def self.save_object(object)
    File.write("#{object}.yml", YAML.dump(object))
  end
end