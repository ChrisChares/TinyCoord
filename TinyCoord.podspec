#
# Be sure to run `pod lib lint TinyCoord.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TinyCoord'
  s.version          = '0.1.0'
  s.summary          = 'Convert a location and zoom level into a very short string'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Convert a CLLocation object and zoom level into a 12 character string.  This is useful for sharing a map viewport across different screen sizes and platforms
                       DESC

  s.homepage         = 'https://github.com/chrischares/TinyCoord'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chris Chares' => 'chris@chares.io' }
  s.source           = { :git => 'https://github.com/chrischares/TinyCoord.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'src/swift/**/*.swift'
  s.frameworks = 'CoreLocation'

  # s.resource_bundles = {
  #   'TinyCoord' => ['TinyCoord/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
