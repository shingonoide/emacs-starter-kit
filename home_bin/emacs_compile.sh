#!/usr/bin/env bash

pushd ~/.emacs.d
emacs --batch \
      --eval "(add-to-list 'load-path (expand-file-name \"~/.emacs.d\"))" \
      --eval "(add-to-list 'load-path (expand-file-name \"~/emacs.d/vendor/rspec-mode\"))" \
      --eval "(batch-byte-compile-if-not-done)" *.el
popd
