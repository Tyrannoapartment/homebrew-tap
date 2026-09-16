class AiUsage < Formula
  desc "Live terminal dashboard for Claude and Codex quota usage"
  homepage "https://github.com/Tyrannoapartment/ai-usage"
  url "https://github.com/Tyrannoapartment/ai-usage/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "f28e399866200f657256bb29d7d1d43ebe9ec7b8fb415587c1ab4348f4e4e5cf"
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
