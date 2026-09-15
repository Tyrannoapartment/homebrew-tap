class AiUsage < Formula
  desc "Live terminal dashboard for Claude and Codex quota usage"
  homepage "https://github.com/Tyrannoapartment/ai-usage"
  url "https://github.com/Tyrannoapartment/ai-usage/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "46921edfedbcf63d29883a216e2041b512fa7121d17384cb9b3545e52b4c5ab9"
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
