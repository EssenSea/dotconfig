;;;init_nanp --- nano-mode -*- lexical-binding: t -*-


(straight-use-package
 '(nano :type git :host github :repo "rougier/nano-emacs"))
(setq nano-font-family-monospaced "CodeNewRoman Nerd Font")
(setq nano-font-family-proportional nil)
(setq nano-font-size 16)
(require 'nano)
(provide 'init_nano)