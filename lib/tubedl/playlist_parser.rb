module PlaylistParser
  YoutubeRegex = /(youtu\.be\/|youtube\.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&"'>]+)/
  
  class Playlist
    attr_reader :playlistID, :playlist, :playlist_data
    
    def initialize(link = nil)
      counter = 'video0000'
      link ||= link_generator
      @playlist_data = parse_page(Nokogiri::HTML(open(link).read))
      @playlist_data.each_pair do |video_name, video_link|
        instance_variable_set('@playlistID', rand(1..(2**30 - 1)))
        instance_variable_set("@#{counter.succ!}", video_name => "https://#{video_link}")
        self.class.send(:attr_reader, counter)
      end
    end
    
    def link_generator(ln = nil)
      print 'Please Enter A Correct Playlist Link: ' unless ln || ARGV[0]
      ln ||= ARGV[0] || gets.chomp
      if ln && is_playlist?(ln)
        return ln
      else
        link_generator
      end
    end
    
    def parse_page(page)
      playlist_data = page.css('table.pl-video-table')
      if playlist_data
        songs_hashes = Hash[playlist_data.css('a.pl-video-title-link').map do |ln|
                              [ln.text.strip, "https://www.youtube.com#{ln['href']}".match(YoutubeRegex)[0]]
                            end]
      end
      songs_hashes
    end
    
    def is_playlist?(link)
      link.include? 'list' && 'playlist'
    end


    
    def save_playlist
      File.write("Playlist-#{Time.now.to_a[3..5].join('-')}.yml", @playlist_data.to_yaml)
    end
  end
end
