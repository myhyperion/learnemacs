(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

   
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8my" "myhyperion")
					    ))


(setq make-backup-files nil) ;; no backup
(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 15)


(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(provide 'init-better-defaults)
