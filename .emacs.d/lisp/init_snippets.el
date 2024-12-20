;;;;;;;;;;;;;;;;;;;;;;;;;
;;yasnippet(代码片段补全)
;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yasnippet
  :straight t
  :init
  :hook
  (prog-mode . yas-minor-mode )
  :config
  (yas-reload-all)
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas
				 company-backends))
  ;; unbind <TAB> completion 
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind
  (:map yas-minor-mode-map ("S-<tab>" . yas-expand))
  )



(use-package yasnippet-snippets
  :straight t
  :after yasnippet
)
(provide 'init_snippets)
