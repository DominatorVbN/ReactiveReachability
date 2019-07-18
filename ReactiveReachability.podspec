#
# Be sure to run `pod lib lint ReactiveReachability.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReactiveReachability'
  s.version          = '0.1.0'
  s.summary          = 'ReactiveRechablity enables us to access network status of our device with ease in realtime.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ReactiveReachability uses delegate pattern to response network change events to observe this events you just have to implement protocol NetworkStatusListener.
                       DESC

  s.homepage         = 'https://github.com/DominatorVbN/ReactiveReachability'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DominatorVbN' => 'amit.samant@engineerbabu.in' }
  s.source           = { :git => 'https://github.com/DominatorVbN/ReactiveReachability.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iOS_Dev_Amit'

  s.ios.deployment_target = '11.0'

  s.source_files = 'ReactiveReachability/Classes/*.swift'
  s.swift_versions = '5.0'
  # s.resource_bundles = {
  #   'ReactiveReachability' => ['ReactiveReachability/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
