(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-packages)
(require 'init-ui)
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(orderless vertico company vc-use-package org-roam-ui magit-section))
 '(package-vc-selected-packages
   '((org-roam :vc-backend Git :url "https://github.com/org-roam/org-roam")
     (vc-use-package :vc-backend Git :url "https://github.com/slotThe/vc-use-package"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
