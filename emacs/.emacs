(tool-bar-mode -2)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode t)
(invert-face 'default)
(set-variable 'scroll-conservatively 5)

(setq c-default-style "linux"
      c-basic-offset  4)

(add-to-list 'auto-mode-alist '("\\.def\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.def\\'" . c-mode))
(set-variable 'backup nil)
