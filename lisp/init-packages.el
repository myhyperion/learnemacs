(when(>= emacs-major-version 24)
  
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
			      popwin
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

;; for mac you'd better put this before other  let emacs could find in mac
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))


(global-hungry-delete-mode)


(smartparens-global-mode t)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

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

(global-company-mode t)

(require 'popwin)
(popwin-mode 1)


(load-theme 'monokai t)

(provide 'init-packages)
