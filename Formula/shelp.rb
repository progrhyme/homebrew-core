class Shelp < Formula
  desc "Git-based package manager for shell scripts written in Go"
  homepage "https://github.com/progrhyme/shelp"
  url "https://github.com/progrhyme/shelp/archive/v0.5.0.tar.gz"
  sha256 "32ef1a1c0c85cc3fdca607dcc415d3032a9b3b770e6e7d1446c76ccb910c3c6a"
  head "https://github.com/progrhyme/shelp.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/progrhyme/shelp").install buildpath.children
    cd "src/github.com/progrhyme/shelp" do
      system "go", "build", "-o", bin/"shelp"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/shelp", "--version"
  end
end
