;;;;;;;;;;;;
;;theme
;;;;;;;;;;;;
;; (use-package base16-theme
;;  :ensure t) 
;; (use-package doom-themes
;;   :straight t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/everforest-theme")

(straight-use-package '(nano-theme :type git :host github
                                   :repo "rougier/nano-theme"))

(use-package hima-theme
  :straight t)
(use-package catppuccin-theme
  :ensure t)
(setq catppuccin-flavor 'latte)
(use-package circadian
  :straight t
  :config
  (setq calendar-latitude 103.35)
  (setq calendar-longitude 34.69)

  (setq circadian-themes '(
			   ("7:30"   .  modus-vivendi)
			   ("18:00"  .  modus-vivendi)
			   ))
  (circadian-setup))

;; (setq default-frame-alist '((alpha-background . 85)))


(custom-set-faces
 '(default
   ((t
     (:family "FiraCode Nerd Font"
	      :foundry "outline"
	      :slant normal
	      :weight regular
	      :height 140
	      :width normal)))))




(provide 'init_theme)
