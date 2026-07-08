class Hys < Formula
  desc "RSS Reader for Digital Minimalists"
  homepage "https://github.com/paulilaaso/hys"
  url "https://github.com/paulilaaso/hys/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7dfd1f73016d91d5824455773362369e679ffbf35eb34722088ee12a977e63bc"
  license "MIT"

  depends_on "pkg-config" => :build
  depends_on "zig@0.16" => :build
  depends_on "curl"

  def install
    ENV.prepend_path "PATH", formula_opt_bin("zig@0.16")

    system "zig", "build", "install",
           "--prefix", prefix,
           "-Doptimize=ReleaseSafe"
  end

  test do
    assert_match "hys", shell_output("#{bin}/hys --version")
  end
end
