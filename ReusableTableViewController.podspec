#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name = "ReusableTableViewController"
  s.version = "0.1.0"
  s.summary = "A simple MVVM-driven table view controller using generics."
  s.homepage = "https://github.com/dclelland/ReusableTableViewController"
  s.license = { :type => 'MIT' }
  s.author = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source = { :git => "https://github.com/dclelland/ReusableTableViewController.git", :tag => "0.1.0" }
  s.ios.source_files = 'Sources/**/*.swift'
  s.ios.deployment_target = '10.0'
  s.ios.dependency 'Reusable', '~> 4.0'
  s.ios.dependency 'RefreshableViewController', '~> 0.3'
end
