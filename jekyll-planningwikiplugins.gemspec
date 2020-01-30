require_relative 'lib/jekyll/planningwikiplugins/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-planningwikiplugins"
  spec.version       = Jekyll::Planningwikiplugins::VERSION
  spec.authors       = ["Adam Green"]
  spec.email         = ["adam.green@kcl.ac.uk"]

  spec.summary       = %q{Plugins to support the maintenance and running of the planning wiki}
  spec.homepage      = "https://www.planning.wiki"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nergmada/jekyll-planningwikiplugins"
  spec.metadata["changelog_uri"] = "https://github.com/nergmada/jekyll-planningwikiplugins"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'jekyll', "~> 3.8.5"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
