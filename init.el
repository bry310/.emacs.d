
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; My Stuff


(setq inhibit-startup-message t)

 (setq url-proxy-services
       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
         ("http" . "196.3.0.55:8080")
         ("https" . "196.3.0.55:8080")))


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap 'use-package'
(unless (packege-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Org-mode stuff
 (use-package org-bullets
    :ensure t
        :init
        (add-hook 'org-mode-hook (lambda ()
                            (org-bullets-mode 1))))
