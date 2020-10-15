;; Make startup faster by reducing the frequency of garbage collection.
(setq gc-cons-threshold (* 50 1000 1000))

;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Configure and install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t)
  (setq use-package-compute-statistics nil))

(eval-when-compile
  (require 'use-package))

;; Load configuration
(use-package org)
(org-babel-load-file (expand-file-name "conf.org" user-emacs-directory))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
