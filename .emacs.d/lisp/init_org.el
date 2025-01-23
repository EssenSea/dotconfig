;; ;;;;;;;;;;;;;;;;;;;;

;; ;;orgmode

;; ;;;;;;;;;;;;;;;;;;;;
(require 'ox-beamer)
(require 'ox-md)
(use-package svg-tag-mode
  :straight t)
(straight-use-package
 '(notebook-mode
   :type git
   :host github
   :repo "rougier/notebook-mode"))

(use-package org
  :ensure t
  :hook 
  (org-mode . org-cdlatex-mode)
  (org-mode . notebook-mode)

  :custom
  ;; LaTeX 高亮设置
  (org-highlight-latex-and-related '(native latex entities)) 
  ;; LaTeX 代码的 prettify
  (org-pretty-entities t) 
  ;; 不隐藏LaTeX的上下标更容易编辑
  (org-pretty-entities-include-sub-superscripts nil)

  (org-format-latex-options
   '(:foreground default :background default :scale 1.8
		 :html-foreground "Black" :html-background "Transparent"
		 :html-scale 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
  ;; 增大公式预览的图片大小

  ;; Choose some fonts
  (set-face-attribute 'default nil :family "Roboto Nerd Font")
  (set-face-attribute 'variable-pitch nil :family "Iosevka Nerd Font")
  ;; Add frame borders and window dividers
  (modify-all-frames-parameters
   '((right-divider-width . 40)
     (internal-border-width . 40)))
  (dolist (face '(window-divider
                  window-divider-first-pixel
                  window-divider-last-pixel))
    (face-spec-reset-face face)
    (set-face-foreground face (face-attribute 'default :background)))
  (set-face-background 'fringe (face-attribute 'default :background))
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"
   org-startup-with-inline-images t

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ─────────────────────────────────────────────────")

  :config
  (setq org-startup-indented t)
  (setq org-log-done 'time)
  (setq org-log-done 'note)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w!)" "|" "DONE(d!)" "CANCEL(c!/@)")
          (sequence "READ(r!)" "REVIEW(!/@)" "PRACTISE(p!/@)"
		    "NOTE(n!/@)" "AMEMDMEMTS(a!/@)" "|" "FINISHED(f!/@)"))))

(provide 'init_org)
