
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t) 
     
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-my-init-file)

(recentf-mode t)
(global-company-mode t)
(setq-default cursor-type 'bar)
(setq make-backup-files nil) ;; no backup

 (delete-selection-mode t)

  (require 'org)
(setq org-src-fontify-natively t)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 15)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
