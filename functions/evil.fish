function evil --description "Run Emacs in Evil mode, via emacsclient"

    # Arguably I should be using argparse to parse arguments.
    # And I should write some help - although honestly I'm the only user,
    # and expect to remember how to use this.
    # Equally, I should perhaps support -kill as well as --kill

    if contains -- --kill $argv
	# Assume we want to kill the server
	# We could run `kill-emacs`, but it seems safer to ask before
	# killing things that need  saving. The answer at
	#   https://stackoverflow.com/a/2270603
	# suggests modifying this to put up a proper windowing-system
	# prompt rather than using the minibuffer - hopefully this will
	# be more obvious when the window with changes is unobvious.
	emacsclient -e '(let ((last-nonmenu-event nil))(save-buffers-kill-emacs))'
	return
    end

    if contains -- -nw $argv
	emacsclient --alternate-editor="" $argv
    else
	# Run in the GUI, so exit immediately.
	# Beware this doesn't shift focus to the new window.
	emacsclient --alternate-editor="" --create-frame --no-wait $argv
    end
end
