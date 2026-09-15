class AiUsage < Formula
  desc "Live terminal dashboard for Claude and Codex quota usage"
  homepage "https://github.com/GiYeongUM/ai-usage"
  url "https://github.com/GiYeongUM/ai-usage/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2b14c2f561cbad04229d98bdf30076530fd9477ed301c46b3af27c95f18487db"
  license "MIT"
  head "https://github.com/GiYeongUM/ai-usage.git", branch: "main"

  depends_on "jq"

  def install
    # bin/ and lib/ must stay siblings: the script resolves its aggregator
    # relative to its own location, following symlinks.
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/ai-usage"
  end

  test do
    system bin/"ai-usage", "--self-test"
  end
end
