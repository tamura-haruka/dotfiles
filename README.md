# dotfiles
my dotfiles

## component
* .bash_profile
* .bashrc
* .inputrc
* .latexmkrc
* .vimrc
* init.vim
* init.lua
* zathurarc

## path
### mac/linux
.bash_profile       ->      ~<br>
.bashrc             ->      ~<br>
.inputrc            ->      ~<br>
.latexmkrc          ->      ~<br>
.vimrc              ->      ~<br>
init.vim            ->      ~/.config/nvim/<br>
init.lua            ->      ~/.comfig/nvim/<br>
starship.toml       ->      ~/.config/<br>
zathurarc           ->      ~/.config/zathura/<br>

### windows
.latexmkrc          ->      ~<br>
.vimrc              ->      ~<br>
init.vim            ->      ~/AppData/Local/nvim/<br>
init.lua            ->      ~/AppData/Local/nvim/<br>

## note
### .latexmkrc
.latexmkrc内のpdfビューアは、windows用のパスになっている。<br>
### init.lua
init.vimはなるべく使わずにinit.luaを使う方がいい。<br>
IME制御のautocmdはOSによって変える。
windowsでは`command = :call system(\'zenhan 0\')`、
macでは`command = ':call system(\'im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman\')'`とする。<br>
vim-vsnipのソースとして自作のスニペットファイルを使用しているので、それらを~/.vsnipに追加する必要がある。
