class Typewriter < Formula
  typewriter_version = "v1.0.0"
  desc "A code translator to translate data structure for client"
  homepage "https://github.com/typwr/typewriter"
  url "https://github.com/typwr/typewriter.git", :tag => typewriter_version
  head "https://github.com/typwr/typewriter.git"

  depends_on :xcode => ["9.0", :build]

  def install
    system "swift build --disable-sandbox -c release -Xswiftc -static-stdlib"
    system "mv .build/release/typewriter typewriter"
    bin.install "typewriter"
  end

  test do
    system "#{bin}/typewriter", "--help"
  end
end
