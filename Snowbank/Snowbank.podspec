
Pod::Spec.new do |spec|

spec.name         = "Snowbank"
spec.version      = "1.0.0"
spec.summary      = "This is a Snowbank framework."
spec.description  = "Snowbank is a platform that makes the process of deploying and managing lightning nodes as easy as possible."
spec.homepage     = "https://www.snowbank.me/"
spec.license = { :type => 'MIT', :text => <<-LICENSE
Copyright 2019
Permission is granted to all Developers
LICENSE
}
spec.author             = { "Giri" => "girisankar30@gmail.com" }
spec.platform     = :ios, "10.0"
spec.source       = { :git => "https://github.com/DevGirisankar/Snowbank.git", :tag => spec.version.to_s }
spec.source_files  = "Snowbank/**/*"
spec.exclude_files = "Snowbank/**/*.plist"
spec.swift_versions = "5.0"

end
