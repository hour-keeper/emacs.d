(use-package package
  :ensure nil
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)
  (when (not package-archive-contents)
  (package-refresh-contents)))

(use-package restart-emacs
  :ensure t)

(use-package company
  :init
  (global-company-mode 1)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)))
(use-package vertico
  :init
  (vertico-mode t))

(use-package orderless
  :init
  (setq completion-styles '(orderless)))

(use-package marginalia
  :init
  (marginalia-mode t))

(use-package embark
  :bind (("C-;" . embark-act)
         :map minibuffer-local-map
         ("C-c C-e" . embark-export-write))
  :init
  (setq prefix-help-command 'embark-prefix-help-command))

(use-package consult
  :bind ("C-s" . consult-line)
  :init
  (progn
    (setq
      consult-narrow-key "<"
      consult-line-numbers-widen t
      consult-async-min-input 2
      consult-async-refresh-delay  0.15
      consult-async-input-throttle 0.2
      consult-async-input-debounce 0.1)))

(use-package wgrep
  :custom
  (setq wgrep-auto-save-buffer t))

(use-package embark-consult
  :after (consult embark)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package org-roam
  :vc (:fetcher "github" :repo "org-roam/org-roam")
  :custom
  (org-roam-directory (file-truename "~/Dropbox/org/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(use-package org-roam-ui
  :vc (:fetcher "github" :repo "org-roam/org-roam-ui")
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

 (use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(provide 'init-packages)
