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

## Demonstrate bug

The `example` gem has been erroneously (on purpose) added to the `source` block for our local Geminabox server, and `bundle install` run to update `Gemfile.lock`. One would expect this to blow up, but since if the gem is already installed, Bundler is happy to update the lock file.

To reveal the issue, run:

```
cd app
gem uninstall example # purge any previously installed versions
bundle install # boom
```

This will result in the following error:

```
Fetching gem metadata from http://localhost:9292/.
Fetching gem metadata from http://localhost:9292/...
Your bundle is locked to example (1.0.2) from rubygems repository http://localhost:9292/ or
installed locally, but that version can no longer be found in that source. That means the
author of example (1.0.2) has removed it. You'll need to update your bundle to a version other
than example (1.0.2) that hasn't been removed in order to install.
```

**This is the state te app has been left in.**

### Failing to recover

Neither moving the gem out of the private `source` block, nor removing it from `Gemfile` entirely will work.

This is probably because the `Gemfile.lock` already refers to the private source, and given the intermediate `some_private_gem` is from the private source, Bundler has no reason to assume it should fallback to Rubygems.org.
