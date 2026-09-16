cask "ai-usage-app" do
  version "0.7.0"
  sha256 "cf49ceeaf6093fec98ca1221a4d3ada4f98318d3e84b42c8b1d133b5967ee96c"

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
