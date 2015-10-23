(set-face-attribute 'default nil :font "Ubuntu Mono 14")

(defvar default-frame-height 40 "Default frame height")
(defvar default-frame-width 132 "Default frame width")

(set-frame-size (selected-frame) (- default-frame-width 1) default-frame-height)
(load-theme 'hc-zenburn t)

(defface font-lock-self-class-face
    '((default (:foreground "light slate gray")))
    "Hightliht 'self' keyword in python sources."
    :group 'font-lock-faces)

(add-to-list 'default-frame-alist (cons 'height (+ default-frame-height 0)))
(add-to-list 'default-frame-alist (cons 'width (+ default-frame-width 1)))
