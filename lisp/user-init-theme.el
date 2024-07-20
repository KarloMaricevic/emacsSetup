(defun user-init-configure-spacemacs-dark ()
  "Configure Spacemacs Dark theme."
  (load-theme 'spacemacs-dark t))

(add-hook 'after-init-hook 'user-init-configure-spacemacs-dark)

(message "config theme")
(provide 'user-init-theme)
