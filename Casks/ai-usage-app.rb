cask "ai-usage-app" do
  version "0.4.1"
  sha256 "0015463942ab17d825fb865d80ec3bf40749b8820ad9b9e97b60926435fc4c04"

  url "https://github.com/Tyrannoapartment/ai-usage/releases/download/v#{version}/AIUsage-#{version}.zip"
  name "AI Usage"
  desc "Menu bar dashboard for Claude and Codex quota usage"
  homepage "https://github.com/Tyrannoapartment/ai-usage"

  # The app shells out to the `ai-usage` tool for every reading.
  depends_on formula: "tyrannoapartment/tap/ai-usage"
  depends_on macos: :monterey

  app "AIUsage.app"

  zap trash: [
    "~/Library/Caches/ai-usage",
    "~/Library/Preferences/com.tyrannoapartment.aiusage.plist",
  ]
end
