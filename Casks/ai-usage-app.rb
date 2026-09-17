cask "ai-usage-app" do
  version "0.7.1"
  sha256 "529452b1b05ad0430aaffd17067af91814ddda690d4894de1c686cfa851d4edf"

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
