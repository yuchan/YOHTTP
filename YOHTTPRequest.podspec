Pod::Spec.new do |spec|
  spec.name         = 'YOHTTPRequest'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/yuchan/YOHTTPRequest'
  spec.authors      = { 'Yusuke Ohashi' => 'yusuke@junkpiano.me' }
  spec.summary      = 'Simple HTTP Request Library.;'
  spec.source       = { :git => 'https://github.com/yuchan/YOHTTPRequest.git', :tag => spec.version.to_s }
  spec.source_files = 'YOHTTPRequest/**/*'
end

