# VIM Eclim

A mirror of the VIM files from [Eclim][1] to support quick and convenient installation via various plugin managers.

**Version [2.21.0][8]**

*Note, several features were removed from Eclim in version [2.18.0][6]. Please see the [Eclim release notes][6] and this [issue][7] for details.*

# Installation

*  [Pathogen][2]
    *  `git clone https://github.com/dansomething/vim-eclim.git ~/.vim/bundle/vim-eclim`
*  [NeoBundle][3]
    *  `NeoBundle 'dansomething/vim-eclim'`
*  [Vundle][4]
    *  `Plugin 'dansomething/vim-eclim'`
*  [Plug][5]
    *  `Plug 'dansomething/vim-eclim'`
*  manual
    *  copy all of the files into your `~/.vim` directory

# File Generation

These files were generated using the following command with paths replaced:

    ./eclim_2.21.0.bin --eclipse=/path/to/Eclipse --vimfiles=/path/to/vim/files --plugins=jdt,wst --yes

[1]: https://github.com/ervandew/eclim
[2]: https://github.com/tpope/vim-pathogen
[3]: https://github.com/Shougo/neobundle.vim
[4]: https://github.com/gmarik/vundle
[5]: https://github.com/junegunn/vim-plug
[6]: http://eclim.org/changes.html#jan-09-2021
[7]: https://github.com/ervandew/eclim/issues/606#issuecomment-756864300
[8]: http://eclim.org/changes.html#nov-10-2021
