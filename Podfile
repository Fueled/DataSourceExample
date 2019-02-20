# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
use_frameworks!

def tools
	pod 'SwiftLint'

	script_phase :name => 'Run SwiftLint', :script => '"${PODS_ROOT}/SwiftLint/swiftlint"', :execution_position => :before_compile
end

target 'DataSourceExample' do
	tools
end
