;; pkgs.el

(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages)

(defun install-my-packages ()
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(setq package-pinned-packages
  '((clojure-mode . "melpa-stable")
  (cider . "melpa-stable")))

(setq my-packages
  '(
    base16-theme
    elpy
    find-file-in-project
    git-commit-mode
    git-gutter+
    git-gutter-fringe+
    git-rebase-mode
    highlight-indentation
    highlight-symbol
    ido-ubiquitous
    idomenu
    iedit
    imenu-anywhere
    jinja2-mode
    lua-mode
    magit
    neotree
    pyvenv
    rainbow-delimiters
    smart-mode-line
    smex
    undo-tree
    yafolding
    yaml-mode
    yasnippet
    flycheck
    ))

(unless (cl-every 'package-installed-p my-packages)
  (install-my-packages))
