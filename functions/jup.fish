function jup --description "Run a 'standardised' Jupyter notebook session"
    jupyter notebook --notebook-dir=$HOME/jupyter-notebooks --no-browser --ip=0.0.0.0
end
