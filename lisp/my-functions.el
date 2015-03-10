
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
    (file-name (buffer-file-name)))
    (if project-dir
    (progn
      (neotree-dir project-dir)
      (neotree-find file-name))
      (progn
    (message "Could not find git project root.")
    (neotree-show)))))
