Pod::Spec.new do |s|
  s.name             = 'kushki-ios-intel'
  s.version          = '2.4.4'
  s.summary          = s.summary = 'Kushki iOS library.'
  s.description      = 'iOS library to integrate with Kushki.'
  s.homepage         = 'https://github.com/Kushki/kushki-ios-intel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kushki' => 'javier@kushkipagos.com' }
  s.source           = { :git => 'https://github.com/Kushki/kushki-ios-intel.git', :tag => "v#{s.version.to_s}" }
  s.ios.deployment_target = '14.3'
  s.source_files     = 'kushki-ios-intel/Classes/**/*'
  s.resources        = "kushki-ios-intel/Assets/**/*"
  s.dependency "Sift"
  s.ios.vendored_frameworks = 'kushki-ios-intel/Frameworks/CardinalMobile.framework'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.swift_version = '5.0'
end
