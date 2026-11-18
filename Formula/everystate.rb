class Everystate < Formula
  desc "TLA+ model checker with a TLC-compatible command-line"
  homepage "https://github.com/mattzcarey/everystate"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.0/everystate-darwin-arm64.tar.gz"
      sha256 "0955ac1ce60e9643ad1f8bb78a5d385dedd83e321ddc23a386d99b4401e03272"
    end
    on_intel do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.0/everystate-darwin-x64.tar.gz"
      sha256 "cdb002657ee4303d820c2f39520eb30bea3521ab79d839212afb211790a06e19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.0/everystate-linux-arm64.tar.gz"
      sha256 "477cf1aa6c2ae97debce656a5c93daead163b5b14438c33a256703349ede55f2"
    end
    on_intel do
      url "https://github.com/mattzcarey/everystate/releases/download/v0.4.0/everystate-linux-x64.tar.gz"
      sha256 "0d34fa2039037b4124907c594acddba6ec684199b428b52aeaa9c9e5603be3f4"
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
