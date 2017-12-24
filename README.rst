My fish setup
=============

Since this is my own fish_ setup, this documentation is intended primarily for
myself, and has not been tested for anyone else's use.

First, do::

    cd ~/.config
    git clone git@github.com:tibs/dotFish.git fish

and then install fish_. If fish is already installed, then do the appropriate
dance to incorporate whatever is already in ``~/.config/fish`` with the clone.

Useful other things to remember:

* In ``.vimrc``, include::

        " Vim wants a Posix compatible shell, which fish is not.
        " Note that this will also affect the shell launched by ``:sh[ell]``
        if &shell =~# 'fish$'
            set shell=sh
        endif

  and::

      " Support for fish shell
      Plugin 'dag/vim-fish'

* Any fish functions whose names start with an underscore will be ignored by
  git (that's my convention, not official fish policy!). The intent is to use
  such functions for defining things that should not be exported off the
  machine (so typically at work). It's definitely worth making them links from
  somewhere that *will* be archived (locally).

* I assume a light terminal background (some sort of "parchment" colour), and
  don't (at least at the moment) attempt to cope with dark backgrounds.

* At time of writing (December 2017) `issue 4521`_ is still outstanding, which
  leads to iTerm2 giving an irritating prompt when starting up a new terminal
  with fish as its shell. This should be fixed sometime in the new year.

.. _fish: https://fishshell.com/
.. _`issue 4521`: https://github.com/fish-shell/fish-shell/issues/4521

I'm not yet using fisherman_ or oh-my-fish_ (omf), so these links are here to
remind me about them.

.. _fisherman: https://github.com/fisherman/fisherman
.. _oh-my-fish: https://github.com/oh-my-fish/oh-my-fish

Other useful links:

* `Release notes`_
* `Milestone 3.0`_ - proposed changes to fish for version 3.0. These may break
  compatibiity.
* `Let's create fish 3.0 (our second major release)`_ explains a lot of the
  thinking behind that.

.. _`Release notes`: https://fishshell.com/release_notes.html
.. _`Milestone 3.0`: https://github.com/fish-shell/fish-shell/milestone/18
.. _`Let's create fish 3.0 (our second major release)`: https://github.com/fish-shell/fish-shell/issues/4154
