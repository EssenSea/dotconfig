;;; Code:utf-8 ---*---

(use-package emacs
  :init
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq inhibit-startup-screen t)
  (electric-pair-mode t)
  (set-face-attribute 'default nil :font "CodeNewRoman Nerd Font Mono"
  :height 130)
  :hook
  ((emacs . electric-pair-mode)
   (emacs . column-number-mode)
   (emacs . auto-revert-mode)
   (emacs . delete-selection-mode)
   ;; (emacs . display-line-numbers-mode)
   (emacs . prettify-symbols-mode)
   (emacs . auto-fill-mode)
   (emacs . savehist-mode)
   (prog-mode . hs-minor-mode)
   (prog-mode . show-paren-mode))
  :config
  (setq-default auto-fill-function 'do-auto-fill)
  (setq make-backup-files t)
  (setq display-line-numbers-type 'relative)
  ;; 可选: 设定启动图形界面时的初始Frame 宽度(字符数)
  (add-to-list 'default-frame-alist '(width . 95 ))
  ;; 可选: 设定启动图形界面时的初始 Frame 高度(字符数)
  (add-to-list 'default-frame-alist '(height . 40))
  )

(provide 'new_global)
