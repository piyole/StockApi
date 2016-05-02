Pod::Spec.new do |s|
  s.name         = 'StockApi'
  s.version      = '0.0.2'
  s.summary      = 'Simple stock API.'
  s.homepage     = 'https://github.com/wegie/StockApi'
  s.license      = 'MIT'
  s.author       = 'wegie'
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/wegie/StockApi.git', :tag => s.version.to_s }
  s.source_files = 'StockApi/**/*.swift'
  s.requires_arc = true

  s.dependency 'CachedApi', '~> 0.0.2'
end
