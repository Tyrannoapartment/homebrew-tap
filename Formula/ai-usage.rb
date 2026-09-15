class AiUsage < Formula
  desc "Live terminal dashboard for Claude and Codex quota usage"
  homepage "https://github.com/Tyrannoapartment/ai-usage"
  url "https://github.com/Tyrannoapartment/ai-usage/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "80af4b3fdf2f76633918468e8e35ebdfbb921bd6e4b77cf259891855ef04bc3a"
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
