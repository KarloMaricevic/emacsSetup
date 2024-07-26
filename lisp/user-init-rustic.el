;; rustic-setup.el
(defun setup-rustic ()
  (require 'rustic)

  ;; Configure rustic keybindings
  (define-key rustic-mode-map (kbd "M-j") 'lsp-ui-imenu)
  (define-key rustic-mode-map (kbd "M-?") 'lsp-find-references)
  (define-key rustic-mode-map (kbd "C-c C-c l") 'flycheck-list-errors)
  (define-key rustic-mode-map (kbd "C-c C-c a") 'lsp-execute-code-action)
  (define-key rustic-mode-map (kbd "C-c C-c r") 'lsp-rename)
  (define-key rustic-mode-map (kbd "C-c C-c q") 'lsp-workspace-restart)
  (define-key rustic-mode-map (kbd "C-c C-c Q") 'lsp-workspace-shutdown)
  (define-key rustic-mode-map (kbd "C-c C-c s") 'lsp-rust-analyzer-status)

  ;; Configure rustic settings
  (setq rustic-format-on-save t))

(setup-rustic)

(provide 'user-init-rustic)
