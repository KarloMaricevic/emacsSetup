(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)

(setq my-keymap (make-sparse-keymap))
(define-key my-keymap (kbd "C-c") 'other-command)
(global-set-key (kbd "C-c") 'my-keymap)

(provide 'user-init-default)
