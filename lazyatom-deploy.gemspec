# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lazyatom-deploy}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Adam"]
  s.date = %q{2010-10-31}
  s.email = %q{james@lazyatom.com}
  s.files = ["Gemfile", "lib/lazyatom", "lib/lazyatom/deploy.rb", "puppet/lazyatom", "puppet/lazyatom/manifests", "puppet/lazyatom/manifests/init.pp", "puppet/lazyatom/templates", "puppet/lazyatom/templates/vhost.erb"]
  s.homepage = %q{http://lazyatom.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Makes deploying my apps much simpler}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<freerange-deploy>, [">= 0"])
      s.add_runtime_dependency(%q<freerange-puppet>, [">= 0"])
    else
      s.add_dependency(%q<freerange-deploy>, [">= 0"])
      s.add_dependency(%q<freerange-puppet>, [">= 0"])
    end
  else
    s.add_dependency(%q<freerange-deploy>, [">= 0"])
    s.add_dependency(%q<freerange-puppet>, [">= 0"])
  end
end
