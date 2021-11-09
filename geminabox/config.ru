require "rubygems"
require "geminabox"

Geminabox.data = File.join(__dir__, "geminabox-data")

run Geminabox::Server
