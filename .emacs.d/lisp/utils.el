
;;--*--utilities--*--
;;;;;;;;;;;;;;;;;;;;
;;amx
;;;;;;;;;;;;;;;;;;;;

;;可以记录我们每次调用 M-x 时输入的命令历史
;;然后每次将最常用的显示在前面
;;对于短时间频繁输入某几个命令的场景非常有用


(use-package amx
  :straight t
  :init (amx-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;which_key(快捷键补全)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
  :straight t
  :init (which-key-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mode line 更加漂亮、方便管理
;;自行探索
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package nerd-icons
  :straight t)
;; (use-package doom-modeline
;;   :straight t
;;   :init (doom-modeline-mode 1)
;;   )
(use-package nano-modeline
    :straight (:host github :repo "rougier/nano-modeline")
    :init
    (nano-modeline-prog-mode t)
    :custom
    (nano-modeline-position 'nano-modeline-footer)
    :hook
    (prog-mode           . nano-modeline-prog-mode)
    (text-mode           . nano-modeline-text-mode)
    (org-mode            . nano-modeline-org-mode)
    (pdf-view-mode       . nano-modeline-pdf-mode)
    (mu4e-headers-mode   . nano-modeline-mu4e-headers-mode)
    (mu4e-view-mode      . nano-modeline-mu4e-message-mode)
    (elfeed-show-mode    . nano-modeline-elfeed-entry-mode)
    (elfeed-search-mode  . nano-modeline-elfeed-search-mode)
    (term-mode           . nano-modeline-term-mode)
    (xwidget-webkit-mode . nano-modeline-xwidget-mode)
    (messages-buffer-mode . nano-modeline-message-mode)
    (org-capture-mode    . nano-modeline-org-capture-mode)
    (org-agenda-mode     . nano-modeline-org-agenda-mode))

;; (use-package powerline
;;   :straight t
;;   :init (powerline-major-mode 1))



(straight-use-package
  '(nano :type git :host github :repo "rougier/nano-emacs"))

;; (use-package smart-mode-line
;;   :straight t
  
  
;;   :init
;;   (setq sml/theme 'respectful)
;;   (setq sml/no-confirm-load-theme t)
;;   (sml/setup)
;;   )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;avy(快速光标跳转，围绕光标操作)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package avy
  :straight t
  :bind
  (("M-j" . avy-goto-char-timer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;marginalia(minibuffer，注解)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package marginalia
  :straight t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;highlight-symbol
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;高亮出当前 Buffer 中所有的、与光标所在处的符号相同的符号
;;例如一些同名变量、函数名等

(use-package highlight-symbol
  :straight t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;rainbow-delimiters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;用不同颜色标记多级括号

(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DIRVISH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dirvish
  :straight t
  :init (dirvish-override-dired-mode)
    :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/"                          "Home")
     ("c" "~/.config/"                  "Configuration")
     ("n" "~/Documents/Notes/"          "Notes")
     ("d" "~/Downloads/"                "Downloads")
     ("m" "/mnt/"                       "Drives")
     ("t" "~/.local/share/Trash/files/" "TrashCan")))
  :config
  ;; (dirvish-peek-mode)             ; Preview files in minibuffer
  ;; (dirvish-side-follow-mode)      ; similar to `treemacs-follow-mode'
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes
        '(nerd-icons file-time file-size collapse subtree-state vc-state git-msg)
        dirvish-side-attributes
        '(vc-state file-size nerd-icons collapse))
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  :bind ; Bind `dirvish-fd|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish)
   :map dirvish-mode-map          ; Dirvish inherits `dired-mode-map'
   ("?"   . dirvish-dispatch)     ; contains most of sub-menus in dirvish extensions
   ("a"   . dirvish-quick-access)
   ("f"   . dirvish-file-info-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ("h"   . dirvish-history-jump) ; remapped `describe-mode'
   ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
   ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-l" . dirvish-ls-switches-menu)
   ("M-m" . dirvish-mark-menu)
   ("M-t" . dirvish-layout-toggle)
   ("M-s" . dirvish-setup-menu)
   ("M-e" . dirvish-emerge-menu)
   ("M-j" . dirvish-fd-jump)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ace-windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ace-window
  :straight t
  :bind
  (("C-x o" . 'ace-window)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;undo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package undo-tree
  :straight t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

(provide 'utils)
