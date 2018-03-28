#
# Be sure to run `pod lib lint NBCollageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBCollageView'
  s.version          = '0.3'
  s.summary          = 'Helps you create new collages dynamically without worrying about minute gestures'
  s.swift_version    = '3.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Helps you create new collages with dynamic layouts without worrying about minute gestures. There is no limit to layout type or number. Gesture dragging of collage is there and you will also be able to swap two images. In addition to it you can also assign a delete button. dragging upon delete button will remove the image from view.'

  s.homepage         = 'https://github.com/nikhilbatra789/NBCollageView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nikhilbatra789' => 'nikhilbatra789@gmail.com' }
  s.source           = { :git => 'https://github.com/nikhilbatra789/NBCollageView.git', :tag => '0.3' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NBCollageView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NBCollageView' => ['NBCollageView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
