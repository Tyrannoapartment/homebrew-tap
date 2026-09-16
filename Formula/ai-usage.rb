class AiUsage < Formula
  desc "Live terminal dashboard for Claude and Codex quota usage"
  homepage "https://github.com/Tyrannoapartment/ai-usage"
  url "https://github.com/Tyrannoapartment/ai-usage/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "3c5d3a7a9bc21e50239e284f0bdb8ca699a11f09e11ed586de2b695806122718"
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
