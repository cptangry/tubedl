# Tubedl

Welcome to your Tubedl gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tubedl`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tubedl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tubedl

## Usage

```ruby
require 'tubedl'
metallica             = Tubedl.Playlist::new 'https://www.youtube.com/playlist?list=PLJvQXRgtxlumAHceNRk3cx3P7MZVUCdBl'

first_song            = metallica.video0001
object_instances      = metallica.instance_variables
first_song_link       = first_song.values.first
first_songID          = Tubedl.get_videoID(first_song_link)
video_list            = metallica.playlist_data
dowload_links         = metallica.playlist_data.values
whole_page_data       = Tubedl.get_page_data(first_song_link)
specific_resulation   = Tubedl.set_quality(first_song_link, 'hd1080')
metallica.save_playlist
metallica.save_smplayer_playlist # That will create a smplayer playlist
# Also can pass path as argument
metallica.save_smplayer_playlist '/home/[USERNAME]/Music'
metallica.save_playlist '/home/[USERNAME]/Music'
# Tubedl.load_playlist(path)
Tubedl.save_object(metallica)

# Rusults
puts first_song
puts first_songID
puts first_song_link
puts object_instances
puts video_list
puts dowload_links
# puts whole_page_data
puts specific_resulation
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cptangry/tubedl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tubedl project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tubedl/blob/master/CODE_OF_CONDUCT.md).
