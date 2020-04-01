Pod::Spec.new do |spec|
  spec.name         = "NeumorphismTab"
  spec.version      = "0.9.6"
  spec.summary      = "Custom TabBarController with Neumorphism."
  spec.homepage     = "https://github.com/touyou/NeumorphismTab"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "touyou" => "touyou.dev@gmail.com" }
  spec.source       = { :git => "https://github.com/touyou/NeumorphismTab.git", :tag => "#{spec.version}" }
  spec.source_files  = "NeumorphismTab/**/*.{swift}"
  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.1"
end
