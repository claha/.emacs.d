;; Make startup faster by reducing the frequency of garbage collection.
(setq gc-cons-threshold (* 50 1000 1000))

;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure that use-package is installed.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(when (not (package-installed-p 'diminish))
  (package-refresh-contents)
  (package-install 'diminish))
(when (not (package-installed-p 'bind-key))
  (package-refresh-contents)
  (package-install 'bind-key))

;; Load configuration
(org-babel-load-file "~/.emacs.d/conf.org")

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
