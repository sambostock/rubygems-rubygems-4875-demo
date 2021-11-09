# frozen_string_literal: true

require_relative "lib/some_private_gem"

Gem::Specification.new do |spec|
  spec.name          = "some_private_gem"
  spec.version       = SomePrivateGem::VERSION
  spec.authors       = ["Sam Bostock"]
  spec.email         = ["sam.bostock@shopify.com"]

  spec.summary       = "Used to demo rubygems/rubygems#4875"

  spec.metadata["allowed_push_host"] = "http://localhost:9292"

  spec.files = ["lib/some_private_gem.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "example", "~> 1.0"
end
