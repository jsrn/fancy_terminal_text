Gem::Specification.new do |s|
  s.name        = 'fancy_terminal_text'
  s.version     = '0.0.1'
  s.summary     = "Rich text formatting for your terminal output."
  s.description = "Rich text formatting for your terminal output."
  s.authors     = ["jsrn"]
  s.email       = 'jsrn@hey.com'
  s.files       = Dir["{lib}/**/*.rb"]
  s.require_path = 'lib'
  s.homepage    = 'https://github.com/jsrn/fancy_terminal_text'
  s.license       = 'MIT'

  s.add_runtime_dependency "colorize"
  s.add_development_dependency "rspec"
end
