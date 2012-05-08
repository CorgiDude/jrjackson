#! /usr/bin/env jruby

Gem::Specification.new do |s|
  s.name        = 'jrjackson'
  s.version     = '0.0.7'
  s.date        = '2012-03-14'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Guy Boertje']
  s.email       = ['guyboertje@gmail.com']
  s.homepage    = "http://github.com/guyboertje/jrjackson"
  s.summary     = %q{A JRuby wrapper for the java jackson json processor jar}
  s.description = %q{}

  # = MANIFEST =
  s.files = %w[
    Gemfile
    README
    Rakefile
    benchmarking/benchmark.rb
    jrjackson.gemspec
    lib/jrjackson.rb
    lib/jr_jackson.rb
    lib/jr_jackson/json.rb
    lib/jr_jackson/smile.rb
    lib/jr_jackson/version.rb
    lib/jr_jackson/deserializers/rubify.rb
    lib/jr_jackson/deserializers/symbolize.rb
    lib/vendor/jackson-core-asl-1.9.5.jar
    lib/vendor/jackson-mapper-asl-1.9.5.jar
    lib/vendor/jackson-smile-1.9.5.jar
    profiling/profiled.rb
  ]
  # = MANIFEST =

  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_development_dependency 'awesome_print', '~> 0.4.0'
end
