class Everystate < Formula
  desc "TLA+ model checker with a TLC-compatible command-line"
  homepage "https://github.com/mattzcarey/everystate"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.3.1/everystate-darwin-arm64.tar.gz"
      sha256 "7a9e58c474753b159b039e70044ac2ab5621250183904cf9c5b68eb95a50005e"
    end
    on_intel do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.3.1/everystate-darwin-x64.tar.gz"
      sha256 "bbf0264e55bb807b28bd8c01c0ac1ae4135b3d2f8ec9f4bcf480a0ede4ad97e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.3.1/everystate-linux-arm64.tar.gz"
      sha256 "0610011c6e84b1e4eb37f5ca4ae372a397d8fd80e85e42e77aa73eeab0c50fcc"
    end
    on_intel do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.3.1/everystate-linux-x64.tar.gz"
      sha256 "512ce32cf3379112802365977ef620dbc6954947e778a46b98bda2d84614c58e"
    end
  end

  def install
    chmod 0755, "everystate"
    bin.install "everystate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everystate --version")
  end
end
