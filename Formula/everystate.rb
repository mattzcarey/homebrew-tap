class Everystate < Formula
  desc "TLA+ model checker with a TLC-compatible command-line"
  homepage "https://github.com/mattzcarey/everystate"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.1/everystate-darwin-arm64.tar.gz"
      sha256 "05936480d491bc3f9d0a5f058d0625950c70b8bb24021721b3ac6c8beb130221"
    end
    on_intel do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.1/everystate-darwin-x64.tar.gz"
      sha256 "13b46ae67d4ecf613bfec4b42436afa4af340447a686a5f6d8599c2623f42774"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.1/everystate-linux-arm64.tar.gz"
      sha256 "18b1802546d2816156f6100c4582e4154bd34e6cf5499045a665f29c6de1f86b"
    end
    on_intel do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.1/everystate-linux-x64.tar.gz"
      sha256 "347c5381c3eb1cb62b788ffa90c562ccd9a6b1df3f3f40e725db6c7b80bd5d68"
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
