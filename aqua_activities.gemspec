require_relative 'lib/aqua_activities/version'

Gem::Specification.new do |spec|
  spec.name          = "aqua-activities"
  spec.version       = AquaActivities::VERSION
  spec.authors       = ["giegeralexandra"]
  spec.email         = ["giegeralexandra@gmail.com"]

  spec.summary       = %q{asdasd}
  spec.description   = %q{asdasd}
  spec.homepage      = "http://www.bob.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.bob.com"
  spec.metadata["changelog_uri"] = "http://www.bob.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.add_development_dependency 'pry'
  spec.add_dependency 'nokogiri'
end
