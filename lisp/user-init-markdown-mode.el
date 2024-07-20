(require 'markdown-mode)
(require 'markdown-preview-mode)

;; Set up markdown-mode for .md files
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun my-markdown-mode-setup ()
  "Custom configurations for Markdown mode."
  ;; Enable visual line mode for better readability
  (visual-line-mode 1)
  (flyspell-mode 1)
  (auto-fill-mode 1)
  (setq markdown-command "multimarkdown")
  )

(add-hook 'markdown-mode-hook 'my-markdown-mode-setup)
(add-hook 'markdown-mode-hook 'markdown-preview-mode)

(provide 'user-init-markdown-mode)
