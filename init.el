;;; Package 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "57290e991bf30a375509b74ea7ecfdb5de5150e0a14130c925582726f003c919" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "6b4f7bde1ce64ea4604819fe56ff12cda2a8c803703b677fdfdb603e8b1f8bcb" "b4fd44f653c69fb95d3f34f071b223ae705bb691fb9abaf2ffca3351e92aa374" "11e5e95bd3964c7eda94d141e85ad08776fbdac15c99094f14a0531f31a156da" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "da8e6e5b286cbcec4a1a99f273a466de34763eefd0e84a41c71543b16cd2efac" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "6c0d748fb584ec4c8a0a1c05ce1ae8cde46faff5587e6de1cc59d3fc6618e164" default)))
 '(lsp-auto-guess-root t)
 '(lsp-prefer-flymake nil t)
 '(lsp-ui-doc-border "black")
 '(lsp-ui-doc-enable t)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-position (quote top))
 '(lsp-ui-sideline-enable nil)
 '(lsp-ui-sideline-ignore-duplicate t)
 '(lsp-ui-sideline-show-code-actions nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (ewal-doom-themes mood-one-theme magit latex-pretty-symbols ccls zenburn-theme yasnippet which-key virtualenvwrapper use-package try pyvenv projectile org-bullets lsp-ui lsp-java lsp-ivy jedi highlight-indentation helm-lsp flycheck faff-theme doom-modeline dap-mode counsel company-lsp color-theme-modern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :height 4.0))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic))))))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My Stuff



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)
(tool-bar-mode -1)

;;UWI-Mona proxy
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;        ("http" . "196.3.0.55:8080")
;;        ("https" . "196.3.0.55:8080")))



(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))


;;;Theme Stuff


(use-package color-theme-modern
  :ensure t )


(use-package zenburn-theme
  :ensure t )

(use-package faff-theme
  :ensure t )
(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init)
  :config ;(all-the-icons-install-fonts)
  )

;(require 'doom-modeline)
;(doom-modeline-mode 0)

(use-package mood-one-theme
  :ensure t)

(use-package ewal-doom-themes
  :ensure t
  )

(load-theme 'doom-one t)

;;;End of Theme Stuff

(use-package try
	:ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))


;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

;;Window Stuff

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package counsel
  :ensure t
  )
(use-package swiper
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  )

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))




;;Python Stuff

;;(use-package elpy ;; TODO remove elpy and use lsp-mode
;;  :ensure t
;;  :init
;;  (elpy-enable))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

;;(venv-workon "p3")
(setq lsp-python-executable-cmd "python3")

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Java
(require 'cc-mode)
(require 'cmake-mode)

(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package dash :ensure t)
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  (lsp-auto-guess-root t)
  (lsp-prefer-flymake nil) ; Use flycheck instead of flymake
  :bind (:map lsp-mode-map ("C-c C-f" . lsp-format-buffer))
  :hook ((python-mode c-mode c++-mode sh-mode cmake-mode tex-mode ) . lsp))

(use-package hydra :ensure t)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  
  (global-company-mode t)
  )

(use-package company-lsp
  :ensure t
  :config
  (setq company-lsp-enable-snippet t)
  (push 'company-lsp company-backends)
  )

(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u" . lsp-ui-imenu))
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  ;; Use lsp-ui-doc-webkit only in GUI
  (setq lsp-ui-doc-use-webkit t)
  ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
  ;; https://github.com/emacs-lsp/lsp-ui/issues/243
  (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
    (setq mode-line-format nil)))
;;Latex stuff
;;(require 'company-lsp)
(add-to-list 'company-lsp-filter-candidates '(digestif . nil))
(add-to-list 'company-backends 'company-math-symbols-unicode)
(setq company-tooltip-align-annotations t)
;;(use-package  latex-unicode-mode
;;  :ensure t)

(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))


(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))

;; More lsp stuff

;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)



(use-package ccls
  :ensure t
  :hook
  ((c-mode c++-mode objc-mode cuda-mode) .
   (lambda () (require 'ccls) (lsp))))


;;Git Stuff
(use-package magit
  :ensure t
  :bind (("C-x g" . magit)))



(provide 'init)
;;; init.el ends here
