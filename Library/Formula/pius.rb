require 'formula'
class GnupgInstalled < Requirement
  fatal true

  satisfy { which('gpg') || which('gpg2') }

  def message; <<-EOS.undent
    Gnupg is required to use these tools.

    You can install Gnupg or Gnupg2 with Homebrew:
      brew install gnupg
      brew install gnupg2

    Or you can use one of several different
    prepackaged installers that are available.
    EOS
  end
end

class Pius < Formula
  homepage 'http://www.phildev.net/pius/'
  url 'http://downloads.sourceforge.net/project/pgpius/pius/2.0.9/pius-2.0.9.tar.bz2'
  sha1 'c8ecdf74b3f704a29f828fdbe0575eb247e21524'

  depends_on GnupgInstalled

  def install
    bin.install 'pius'
    bin.install 'pius-keyring-mgr'
    bin.install 'pius-party-worksheet'
  end
end