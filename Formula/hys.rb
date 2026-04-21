class Hys < Formula
  desc "RSS Reader for Digital Minimalists"
  homepage "https://github.com/superstarryeyes/hys"
  url "https://github.com/superstarryeyes/hys/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "60663a538f211f228c09d174c3c9de0e0570841c03adf5a61ae61dafa7dfeda2"
  license "MIT"

  depends_on "pkg-config" => :build
  depends_on "zig" => :build
  depends_on "curl"

  def install
    system "zig", "build", "install", "--prefix", prefix, "-Doptimize=ReleaseSafe"
  end

  test do
    assert_match "hys", shell_output("#{bin}/hys --version")
  end
end
