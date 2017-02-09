
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
  (when(>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )
  (require 'cl)

  ;; add whatever packages you want here
  (defvar myhyperion/packages '(
                                company
				monokai-theme
				hungry-delete
				swiper
				counsel
				smartparens
				js2-mode
				nodejs-repl
				exec-path-from-shell ;; mac need
                                ) "default packages")
(setq package-selected-packages myhyperion/packages)
  (defun myhyperion/packages-installed-p ()
    (loop for pkg in myhyperion/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

  (unless (myhyperion/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg myhyperion/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)

;; for mac you'd better put this before other  let emacs could find in mac
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; config js2-mode for js files
;;(setq auto-mode-alist
  ;;    (append
    ;;   '(("\\.js\\'" . js2-mode))
      ;; auto-mode-alist))
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(require 'nodejs-repl)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

(recentf-mode t)
(global-company-mode t)
(setq-default cursor-type 'bar)
(setq make-backup-files nil) ;; no backup

 (delete-selection-mode t)

  (require 'org)
(setq org-src-fontify-natively t)

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 15)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(load-theme 'monokai t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; org
(setq org-agenda-files '("~/orgs"))
(global-set-key (kbd "C-c a") 'org-agenda)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
 
