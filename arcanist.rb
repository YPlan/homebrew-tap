class Arcanist < Formula
  homepage "http://phabricator.org/"
  # To upgrade:
  # 1. update the SHAs to point at the new versions of arc and libphutil we use
  # 2. increment the 'version'

  url "https://github.com/phacility/arcanist.git", :revision => "7bb8dbabce83a3cd3c26fc5413a9a3429b97863b"
  version "2017.29"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git", :revision => "0a4487d37cd72b3b91ac332377f2b12d4e5a2543"
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
