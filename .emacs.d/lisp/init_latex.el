;;;---*---Code:UTF8---*---
(use-package cdlatex
  :after tex
  :straight (:host github :repo "cdominik/cdlatex" )
  )
 ;; (use-package xenops
 ;;   :straight t
 ;;   :after tex)
(use-package tex
  :straight
  auctex
  :hook(
  (LaTeX-mode . cdlatex-mode)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . outline-minor-mode)
  ;(LaTeX-mode . prettify-symbols-mode)
  (LaTeX-mode . TeX-fold-mode)
  (LaTeX-mode . yas-minor-mode)
  ;(LaTeX-mode . flycheck-mode)
  ;; (LaTeX-mode . xenops-mode)
  )
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master t)
;; ;; PDF正向搜索相关设置
  (setq TeX-PDF-mode t)
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
;;   (setq TeX-view-program-selection '(("Sumatrapdf"
;; 	("\"c:/ProgramData/scoop/apps/sumatrapdf/current/SumatraPDF.exe\"
;; 	-reuse-instance" (mode-io-correlate " -forward-search %b %n ")
;; 	" %o"))))
  (setq TeX-view-program-selection '(("sioyek"
				      ("/usr/bin/sioyek"))
				     ))
  :custom
  (LaTeX-preview-setup t)
  (preview-supports-image-type 'dvipng)
  (reftex-plug-into-AUCTeX t)
  )

(provide 'init_latex)
 ;;; init_latex.el ends here
