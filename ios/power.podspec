#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint power.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'power'
  s.version          = '0.3.0'
  s.summary          = 'A Flutter plugin to access device power related information.'
  s.description      = <<-DESC
A Flutter plugin to access device power related information.
                       DESC
  s.homepage         = 'https://github.com/Amir-P/power'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Amir_P' => 'amirpanahandeh@yahoo.com' }
  s.source           = { :http => 'https://github.com/Amir-P/power' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
