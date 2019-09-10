cask "dotnet-sdk-2.2.100" do
  version "2.2.107,2.2.5"
  sha256 "a163baac1a6e447367b67726669a3cf42b1a65c2f374e92c28c38d6753c210d2"

  url "https://download.visualstudio.microsoft.com/download/pr/d3392a3f-8437-4357-8ed1-58061a421ab7/4e354d4a659d1ac4b20ebacb2dedf656/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
  appcast "https://www.microsoft.com/net/download/macos"
  name ".NET Core SDK #{version.before_comma}"
  homepage "https://www.microsoft.com/net/core#macos"

  depends_on macos: ">= :sierra"

  pkg "dotnet-sdk-#{version.before_comma}-osx-x64.pkg"

  uninstall pkgutil: "com.microsoft.dotnet.dev.#{version.before_comma}.component.osx.x64"

  zap trash: [
    "~/.dotnet",
    "~/.nuget"
  ],
      pkgutil: [
        "com.microsoft.dotnet.dev.#{version.before_comma}.component.osx.x64",
        "com.microsoft.dotnet.hostfxr.#{version.after_comma.before_colon}.component.osx.x64",
        "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.#{version.after_comma.before_colon}.component.osx.x64",
        "com.microsoft.dotnet.sharedhost.component.osx.x64"
      ]
end
