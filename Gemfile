source "https://rubygems.org"

ruby "~>3.1.4"

gem "fastlane", "~>2.219"
gem "jazzy", "~>0.14"
gem "xcodeproj", "~>1.24"
gem "xcode-install", "~> 2.6.6"
gem "asciidoctor-reducer" 

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
