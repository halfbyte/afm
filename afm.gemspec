require 'rake'
Gem::Specification.new do |s|
  s.name = %q{afm}
  s.version = File.read('VERSION')

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jan Krutisch"]
  s.date = %q{2014-06-19}
  s.description = %q{a simple library to read afm files and use the data conveniently}
  s.email = %q{jan@krutisch.de}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = FileList[
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "CHANGELOG.md",
    "lib/*.rb",
    "test/*",
    "test/fixtures/*"
  ]
  s.homepage = %q{http://github.com/halfbyte/afm}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{reading Adobe Font Metrics (afm) files}
  s.license = "MIT"
  s.add_development_dependency "rake", "~> 10.3"
  s.add_development_dependency "rdoc", "~> 4.1"
  s.add_development_dependency "minitest", "~> 5.3"

end

