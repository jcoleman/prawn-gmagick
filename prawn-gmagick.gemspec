Gem::Specification.new do |s|
  s.name = "prawn-gmagick"
  s.version = "0.0.4"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Evan Sharp"]
  s.license = "MIT"
  s.summary = "Use GraphicsMagick to load images in a Prawn docuemnt"
  s.extensions = %w[ext/image/extconf.rb]
  s.require_path = "lib"
  s.add_dependency "prawn", "~> 0.14"
  s.add_dependency "rake-compiler"
  s.add_dependency "mini_portile"
  s.add_development_dependency "minitest"
  s.files = Dir.glob("{ext,lib,test}/**/*") + %w[README.markdown Rakefile]
end
