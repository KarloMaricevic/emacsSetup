(defun user-init-set-rust-mode ()
  "Set Rust mode"
  (setq rust-format-on-save t)
  (flycheck-mode)
  (require 'cargo)
  (setup-rust-company-backends)
  )
(add-hook 'rust-mode-hook 'user-init-set-rust-mode)

(provide 'user-init-rust-mode)
