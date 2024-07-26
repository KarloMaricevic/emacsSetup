;; rust-mode-setup.el
(defun setup-rust-mode ()
  "Set up additional Rust mode configurations."
  ;; Define and add the rustic mode hook
  (defun custom-rustic-mode-hook ()
    "Customize settings for rustic mode."
    (when buffer-file-name
      (setq-local buffer-save-without-query t))
    (add-hook 'before-save-hook 'lsp-format-buffer nil t))
  
  (add-hook 'rustic-mode-hook 'custom-rustic-mode-hook)

  ;; Define and add the rust mode setup
  (defun rust-mode-setup ()
    "Set up Rust mode."
    (flycheck-mode)
    (require 'cargo)
    (setup-rust-company-backends))
  
  (add-hook 'rust-mode-hook 'rust-mode-setup))

(provide 'user-init-rust-mode)
