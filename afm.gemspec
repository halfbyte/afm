require "rake"
Gem::Specification.new do |s|
  s.name = "afm"
  s.version = File.read("VERSION")
  s.authors = ["Jan Krutisch"]
  s.summary = "reading Adobe Font Metrics (afm) files"
  s.description = "a simple library to read afm files and use the data conveniently"
  s.email = "jan@krutisch.de"
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
  s.homepage = "http://github.com/halfbyte/afm"
  s.require_paths = ["lib"]
  s.license = "MIT"
  s.add_development_dependency "rake", "~> 13.3"
  s.add_development_dependency "rdoc", "~> 6.14"
  s.add_development_dependency "minitest", "~> 5.25"
end
