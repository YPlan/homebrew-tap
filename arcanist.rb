class Arcanist < Formula
  homepage "http://phabricator.org/"
  url "https://github.com/phacility/arcanist.git", :revision => "66ab1c955d27ff7875f62eb51a0bd6c4770a7ae3"
  version "0.1"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git", :revision => "e9ed72483a14b86d6f770dca589443d31523f415"
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
