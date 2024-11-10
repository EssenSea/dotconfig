
(require 'package)
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

 (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ;;("gnu" . "http://1.15.88.122/gnu/")		 
                         ;;("melpa" .               "http://1.15.88.122/melpa/")
                         ;;("nongnu" .             "http://1.15.88.122/nongnu/")
                         ;;("melpa-stable" .    "http://1.15.88.122/stable-melpa/")
                         ;;("org" . "http://1.15.88.122/org/")
			 ))

 (eval-when-compile
   (require 'use-package))
 (package-initialize)





(provide 'init_use_package)
