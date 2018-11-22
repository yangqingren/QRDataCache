#
# Be sure to run `pod lib lint QRDataCache' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'QRDataCache'
    s.version          = '0.1.0'
    s.summary          = 'disk data storage cache. 磁盘存储'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/yangqingren/QRDataCache'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '杨庆人' => '564008993@qq.com' }
    s.source           = { :git => 'https://github.com/yangqingren/QRDataCache.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.frameworks = 'Foundation','UIKit'
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'QRDataCache/Classes/**/*'
    
    #s.resource     = 'QRDataCache/Assets/*.bundle'
    
    s.dependency 'LKDBHelper'
    
end
