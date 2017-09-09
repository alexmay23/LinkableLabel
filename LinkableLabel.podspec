e#
#  Be sure to run `pod spec lint LinkableLabel.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "LinkableLabel"
s.summary = "LinkableLabel can make links in UILabel"
s.requires_arc = true

s.version = '0.0.1'
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Alex Moiseenko" => "alexmoiseenko@me.com" }
s.homepage = "https://github.com/alexmay23/LinkableLabel"

s.source = { :git => "https://github.com/alexmay23/LinkableLabel.git", :tag => "#{s.version}"}
s.framework = "UIKit"


s.source_files = "Sources/**/*.{h,m}"


end
