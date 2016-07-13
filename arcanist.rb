class Arcanist < Formula
  homepage "http://phabricator.org/"
  # To upgrade:
  # 1. update the SHAs to point at the new versions of arc and libphutil we use
  # 2. increment the 'version'

  url "https://github.com/phacility/arcanist.git", :revision => "4d4d16f25985f133501f20fdddd183e525f00341"
  version "2016.28"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git", :revision => "32c56dc20b39cffd0cfef931f6f4ab9c99f12677"
  end

  def install
    (prefix/"libphutil").install resource("libphutil")

    (prefix/"arcanist").install %w[bin externals resources scripts src]
    bin.install_symlink prefix + "arcanist/bin/arc"
  end

  test do
    system bin/"arc", "help"
  end

  def caveats
    <<-EOS.undent
    Arcanist will be unable to update itself via the normal means (`arc update`).
    To update Arcanist, use `brew reinstall arcanist`.
    EOS
  end
end
