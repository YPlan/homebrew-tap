class Arcanist < Formula
  homepage "http://phabricator.org/"
  # To upgrade:
  # 1. update the SHAs to point at the new versions of arc and libphutil we use
  # 2. increment the 'version'

  url "https://github.com/phacility/arcanist.git", :revision => "ccbaee585e1a350d1ff970c30481079dc8471a7c"
  version "0.2"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git", :revision => "f5f44f3a2c0bd5ca7950e9404841c1cca9de8ee0"
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
