cask "ai-usage-app" do
  version "0.6.0"
  sha256 "966798e128a8593f04c3f42af10c0ae558fa86ee8ea995697b1f5d2a962bee7a"

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
