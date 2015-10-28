;; emacs doesn't work with fish shell
(setq shell-file-name "/bin/bash")

;; mode line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/apply-theme 'respectful)
(sml/setup)

;; undo
(require 'undo-tree)
(global-undo-tree-mode t)
(setq undo-tree-auto-save-history t)

;; ido & friends
(require 'uniquify)
(require 'ido)
(require 'idomenu)
(require 'smex)

(setq ido-enable-flex-matching t)
(ido-mode)
(ido-ubiquitous-mode)
(smex-initialize)
(fset 'yes-or-no-p 'y-or-n-p)

;; iedit
(require 'iedit)

;; rainbow
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; yafolding
(require 'yafolding)
(yafolding-mode)

;; flycheck
(require 'flycheck)
(global-flycheck-mode 1)

;; saveplace
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saved-places")
(setq-default save-place t)

;; git
 (require 'magit)
 (add-hook 'magit-mode-hook 'magit-load-config-extensions)
 (require 'git-gutter-fringe+)
 (global-git-gutter+-mode 1)


;; elpy & python
(require 'elpy)
(elpy-enable)
(elpy-use-ipython)
(setq elpy-modules (delete 'elpy-module-flymake elpy-modules))
(add-to-list 'python-font-lock-keywords '("\\_<self\\_>" 0 'font-lock-self-class-face))
(add-to-list 'auto-mode-alist '("[.]rpy$" . python-mode))
(add-to-list 'auto-mode-alist '("[.]tac$" . python-mode))
(put 'test-case-name 'safe-local-variable (lambda (x) t))
(add-hook 'python-mode-hook (lambda () (linum-mode 1)))

;; dired
; (require 'dired)
; (require 'dired-x)
; (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))
; (setq-default dired-omit-files-p t)

;; snippets
(require 'yasnippet)
(setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
(remove-hook 'yas-global-mode-hook 'yas--global-mode-reload-with-jit-maybe)
(yas-global-mode 1)
(add-hook 'yas-global-mode-hook 'yas--global-mode-reload-with-jit-maybe)

;; neotree
(require 'neotree)
(setq-default neo-smart-open t)

;; don't create empty lines at the top of neotree buffer
(defun neo-buffer--newline-and-begin ()
  (unless (= (point) (point-min))
    (newline)
    (beginning-of-line)))


;; jade
(require 'jade-mode)

;; scss
(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook
  (lambda () 
    (setq tab-width 2)
    (setq c-basic-offset 2) 
    (setq indent-tabs-mode t)))

;; js
(add-hook 'js-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq js-indent-level 2)
    (setq indent-tabs-mode nil)))

;; jinja2
(require 'jinja2-mode)

(require 'eyebrowse)
(eyebrowse-mode t)

(require 'spaceline)
(require 'spaceline-segments)
(require 'spaceline-config)

(setq powerline-default-separator 'wave)

(require 'pyvenv)
(spaceline-define-segment pyvenv-name
  "Python virtualenv name"
  pyvenv-virtual-env-name
  :enabled "testtesttest")

(spaceline-toggle-pyvenv-name-on)

(spaceline-install

 '(((workspace-number)
   :fallback evil-state
   :separator "|"
   :face highlight-face)
  anzu
  (buffer-modified buffer-id remote-host)
  major-mode
  (pyvenv-name
   :when active
   :face highlight-face)
  ((flycheck-error flycheck-warning flycheck-info)
   :when active)
  (erc-track :when active)
  (version-control :when active)
  (org-pomodoro :when active)
  (org-clock :when active)
  nyan-cat)

 `(selection-info
   ((point-position
     line-column)
    :separator " | ")
   (global :when active)
   buffer-position
   hud))
