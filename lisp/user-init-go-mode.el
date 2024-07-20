(defun user-init-set-go-mode ()
  "Set go mode"
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))


(add-hook 'go-mode-hook 'user-init-set-go-mode)

(provide 'user-init-go-mode) 
