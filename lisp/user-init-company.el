(add-hook 'after-init-hook #'(lambda()
			       (global-company-mode)
                               ;; Add company backends
                               (add-to-list 'company-backends 'company-anaconda)
                               (add-to-list 'company-backends 'company-flow)
                               (add-to-list 'company-backends 'company-restclient)
                               ;; Config company backends
                               (setq company-flow-modes '(js-mode js2-mode js2-jsx-mode web-mode))
                               (setq company-minimum-prefix-length 1)
                               (setq company-idle-delay 0.0)
                               ))

;; configure company for go
(defun setup-go-company-backends ()
  "Configure company-mode backends for Go mode."
  (setq-local company-backends '((company-lsp company-files company-dabbrev-code company-keywords company-capf)))
  (company-mode))
(add-hook 'go-mode-hook #'setup-go-company-backends)

;; Configure company for Rust
(defun setup-rust-company-backends ()
  "Configure company-mode backends for Rust mode."
  (setq-local company-backends '((company-capf company-files company-dabbrev-code company-keywords)))
  (company-mode))
(add-hook 'rust-mode-hook #'setup-rust-company-backends)

(defun setup-markdown-mode-company-setup ()
  "Set up company-mode for Markdown mode."
  (company-mode 1))
(add-hook 'markdown-mode-hook 'my-markdown-mode-company-setup)

(message "config auto-complete")
(provide 'user-init-company)
