(defun user-init-set-lsp-mode ()
  "Set lsp mode."
  (setq gc-cons-threshold 1000000000)
  (setq read-process-output-max (* 10 1024 1024)) ;; 1mb
  (setq lsp-completion-provider :capf)
  (setq lsp-idle-delay 0.500)
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-lens-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions t)
  ;; (setq lsp-ui-sideline-enable t)
  ;; (setq lsp-ui-sideline-update-mode 'line)
  (setq lsp-ui-sideline-show-hover t)
  ;; lsp ui peek
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-use-childframe nil)
  ;; this stops freezes when get lsp results
  (setq lsp-print-performance t)
  ;; start lsp
  (require 'lsp-pyright)
  (lsp)
  ;; (lsp-deferred)
  (message "lsp mode is activated")
)

(add-hook 'sh-mode-hook 'user-init-set-lsp-mode)

;; go set up
(defun setup-go-lsp ()
  "Set up `lsp-mode` for Go."
  (when (derived-mode-p 'go-mode)
    (require 'lsp-go)  ;; Ensure `lsp-go` is loaded
     (setq lsp-go-server 'gopls) 
    (lsp)))  ;; Start the LSP server
(add-hook 'go-mode-hook #'setup-go-lsp)

;; Rust setup
(defun setup-rust-lsp ()
  "Set up `lsp-mode` for Rust."
  (when (derived-mode-p 'rust-mode)
    (require 'lsp-rust)  ;; Ensure `lsp-rust` is loaded
    (setq lsp-rust-server 'rust-analyzer)
    (lsp)))  ;; Start the LSP server
(add-hook 'rust-mode-hook #'setup-rust-lsp)

(provide 'user-init-lsp-mode)
