module YoutubeVideo
  def self.get_videoID(link)
    link.match(PlaylistParser::YoutubeRegex)
  end
end
