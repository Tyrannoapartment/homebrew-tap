class AiUsage < Formula
  desc "Live terminal dashboard for Claude and Codex quota usage"
  homepage "https://github.com/Tyrannoapartment/ai-usage"
  url "https://github.com/Tyrannoapartment/ai-usage/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "aac98e9edbf44d207563a34bf07b1dabb1d03a7d9e0f6b866456e3080e562a3d"
  license "MIT"
  head "https://github.com/Tyrannoapartment/ai-usage.git", branch: "main"

  depends_on "jq"

  def install
    # bin/ and lib/ must stay siblings: the script resolves its aggregator
    # relative to its own location, following symlinks.
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/ai-usage"
    (share/"ai-usage").install "extras/ai-usage.30s.sh"
  end

  test do
    system bin/"ai-usage", "--self-test"
  end
end
