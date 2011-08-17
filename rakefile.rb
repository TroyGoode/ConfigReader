require 'albacore' # >= 0.2.7
require 'fileutils'

version = '1.0'

task :default => [:build]

assemblyinfo :generate_assemblyInfo do |asm|
  asm.version = version
  asm.company_name = "Reshef Mann"
  asm.product_name = "ConfigReader"
  asm.title = "ConfigReader"
  asm.description = ""
  asm.copyright = "Apache License, Version 2.0"
  asm.custom_attributes \
	:CLSCompliant => true,
	:ComVisible => false,
	:Guid => "4622b561-de80-4f3f-9869-50647c33d779",
	:AllowPartiallyTrustedCallers => nil,
	:AssemblyFileVersion => version,
	:AssemblyConfiguration => '',
	:AssemblyTrademark => '',
	:AssemblyCulture => '',
	:InternalsVisibleTo => 'ConfigReader.Tests'
  asm.namespaces "System", "System.Security", "System.Runtime.CompilerServices"
  asm.output_file = "src/app/ConfigReader/Properties/AssemblyInfo.cs"
end

msbuild :build => [:generate_assemblyInfo] do |msb|
  msb.properties :configuration => :Debug
  msb.targets :Clean, :Rebuild
  msb.solution = "ConfigReader.sln"
end

#TODO: test
#nunit :test => [:build] do |nunit|
#	nunit.command = "NUnit/nunit-console.exe"
#	nunit.assemblies "assemblies/TestSolution.Tests.dll"
#end

#TODO: do release build
#TODO: ILMerge dependency on Castle.DictionaryAdapter
#TODO: generate NuSpec
#TODO: package to .nupkg
#TODO: push nupkg to nuget.org