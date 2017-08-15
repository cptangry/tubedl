# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/tubedl/version"

Gem::Specification.new do |spec|
  spec.name          = "tubedl"
  spec.version       = Tubedl::VERSION
  spec.authors       = ["Gökhan Çağlar"]
  spec.email         = ["caglar.gokhan@gmail.com"]

  spec.summary       = %q{This gem parses youtube playlists to abject with an instance that named as playliat_data(hash: video_names => links)
                          also can save that instance as yaml, can chack a video link format with regex, can create link to specific resulation
                          can take wkole page data of a link, can take video ID from link and can save object as yaml }
  spec.description   = %q{This gem parses youtube playlists to abject with an instance that named as playliat_data(hash: video_names => links)
                          also can save that instance as yaml, can chack a video link format with regex, can create link to specific resulation
                          can take wkole page data of a link, can take video ID from link and can save object as yaml }
  spec.homepage      = "https://github.com/cptangry/tubedl"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "nokogiri", '~> 1.8'

end
