require_relative "lib/pinterest/version"

Gem::Specification.new do |spec|
  spec.name = "rails-pinterest"
  spec.version = Pinterest::VERSION
  spec.authors = ["Donald Lee"]
  spec.email = ["donaldlee50@gmail.com"]

  spec.summary = "Pinterest API + Ruby!"
  spec.homepage = "https://github.com/royalgiant/rails-pinterest"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/royalgiant/rails-pinterest"
  spec.metadata["changelog_uri"] = "https://github.com/royalgiant/rails-pinterest/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_dependency "faraday", ">= 1"
  spec.add_dependency "faraday-multipart", ">= 1"
end
