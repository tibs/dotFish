function workon --description "Activate Python virtualenv for named environment"

    # Assumes the virtual environment is in ~/.venv
    # So create a new virtual environment in the normal manner::
    #
    #  $ python3 -m venv ~/.venv/<name>
    #
    # where <name> is the virtual environment name.

    if test (count $argv) != 1
        echo "workon takes a single argument"
        echo "  --list to list the virtual environments in ~/.venv"
        echo "  <name> to source ~/.venv/<name>/bin/activate.fish"
        return
    end

    if contains -- --list $argv
        # Just list the available environments
        ls $HOME/.venv
        return
    end

    source $HOME/.venv/$argv[1]/bin/activate.fish
end
