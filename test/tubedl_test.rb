# coding: utf-8

require_relative 'test_helper'

describe Tubedl do
  before do
    Tubedl::VERSION.wont_be_nil
    @youtube_playlist = Tubedl::PlaylistParser::Playlist.new 'https://www.youtube.com/playlist?list=PLJvQXRgtxlumAHceNRk3cx3P7MZVUCdBl'
  end

  describe 'playlist nesnesi oluşturulduğunda' do
    it 'şu niteliklere sahiptir' do
      @youtube_playlist.playlistID.must_be_kind_of Integer
      @youtube_playlist.instance_variables.each do |i|
        i.must_be_kind_of String
        @youtube_playlist.instance_variables_get(i.to_sym).must_be_kind_of Hash
      end
    end
  end
end
