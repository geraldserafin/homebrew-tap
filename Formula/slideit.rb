class Slideit < Formula
  desc "Presentations written in a small tag markup, with code transitions animated by an AST diff"
  homepage "https://github.com/geraldserafin/md-slides"
  url "https://registry.npmjs.org/@geraldserafin/slideit/-/slideit-0.2.0.tgz"
  sha256 "d3762f898b72ff9f54a979a7a7352d573e5b42c792e25a25a35c36511444c599"
  license "BSD-3-Clause"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      The pdf target prints with Chrome or Chromium: install one (brew install --cask chromium)
      or point the CHROMIUM environment variable at it.
    EOS
  end

  test do
    system bin/"slides", "new", "talk"
    assert_match "ok", shell_output("#{bin}/slides check talk")
  end
end
