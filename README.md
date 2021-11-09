# rubygems/rubygems#4875 Demo

Repository for replicating the issue described in [rubygems/rubygems#4875](https://github.com/rubygems/rubygems/issues/4875).

## Running the Geminabox server

For almost everything in this demo, you should have the Geminabox server running.

```sh
cd geminabox
bundle install
bundle exec rackup # uses localhost:9292 by default
```

## Building gem locally

The built version of the gem has already been committed to the repo, but if it needs to be rebuilt, run the following:

```sh
cd geminabox
bundle install
bundle exec gem build -C ../some_private_gem some_private_gem.gemspec
```

## Publishing Gem locally

Similarly, the gem has already been uploaded to the server, and the DB committed to the repo, but to repeat the process, run the following:

```sh
cd geminabox
bundle install
bundle exec gem inabox --host http://localhost:9292 --overwrite ../some_private_gem/some_private_gem-0.1.0.gem
```
