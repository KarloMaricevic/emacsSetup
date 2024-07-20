(require 'package)
(require 'user-init-config)


(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; refresh packages list in package menager
(when (not package-archive-contents)
  (package-refresh-contents))

;; install packages that is stored in user-packages variable
(dolist (p user-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))

(message "config packages")
(provide 'user-init-packages)
