(setq inhibit-startup-screen t
      create-lockfiles nil
      make-backup-files nil
      column-number-mode t
      scroll-error-top-bottom t
      show-paren-delay 0.5
      use-package-always-ensure t
      scroll-conservatively 5
      sentence-end-double-space nil)

(setq-default indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4)

(tool-bar-mode -2)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode t)
(invert-face 'default)

(add-to-list 'auto-mode-alist '("\\.def\\'" . c-mode))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package ensime
  :ensure t
  :pin melpa-stable)
