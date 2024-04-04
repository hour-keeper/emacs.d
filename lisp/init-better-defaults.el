;; use-package
(eval-when-compile (require 'use-package))
(unless (package-installed-p 'vc-use-package)
  (package-vc-install "https://github.com/slotThe/vc-use-package"))
(require 'vc-use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Automatic loading of externally modified files
(global-auto-revert-mode 1)

;; Disable Emacs from automatically generating backup files
(setq make-backup-files nil)

;; Turning off automatic file saving
(setq auto-save-default nil)

;; Turning off the warning tone in Emacs
(setq ring-bell-function 'ignore)

;; Open recently edited files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; Deleting feature configuration
(delete-selection-mode 1)

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
              history-length 1000
              savehist-additional-variables '(mark-ring
                                              global-mark-ring
                                              search-ring
                                              regexp-search-ring
                                              extended-command-history)
              savehist-autosave-interval 300)
  )

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

(provide 'init-better-defaults)

