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
(setq lsp-rust-analyzer-server-command '("rust-analyzer"))

;; Optional: Additional rust-analyzer configuration
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
(setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)
(setq lsp-rust-analyzer-display-reborrow-hints nil)

;; Function to set up `lsp-mode` for Rust
(defun setup-rust-lsp ()
  "Set up `lsp-mode` for Rust."
  (when (derived-mode-p 'rust-mode)
    (lsp)))  ;; Start the LSP server

;; Add `setup-rust-lsp` to `rust-mode-hook`
(add-hook 'rust-mode-hook 'setup-rust-lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable t) 
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-delay 0.3))

(add-hook 'lsp-mode-hook 'lsp-ui-mode)


(provide 'user-init-lsp-mode)
