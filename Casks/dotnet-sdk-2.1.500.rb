cask "dotnet-sdk-2.1.500" do
  version "2.1.500,2.1.6"
  sha256 '897de45f5764c3efb9a35d225eb668d355f24c34920a26a1310115658fee3283'

  url "https://download.visualstudio.microsoft.com/download/pr/59a7b78f-4e86-473b-b230-c84d15505cec/766e3e5f35e7bb9677dd785071c5fbf7/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
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
