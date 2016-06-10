class Arcanist < Formula
  homepage "http://phabricator.org/"
  # To upgrade:
  # 1. update the SHAs to point at the new versions of arc and libphutil we use
  # 2. increment the 'version'

  url "https://github.com/phacility/arcanist.git", :revision => "2234c8cacc21ce61c9c10e8e5918b6a63cc38fc8"
  version "0.3"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git", :revision => "5eaf0a9f5a3540a2eba9c75b4e792d0fb26cf69a"
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
