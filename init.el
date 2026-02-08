;; get org mode
(require 'org)
;; load jblow's colorscheme from an .el file
(load "~/.emacs.d/jblow_colors.el")

(ido-mode 1)

;; some keybinds

;; comment line just like the nvim gods intended
(define-key evil-normal-state-map (kbd "gcc") 'comment-line)

 
(setq ring-bell-function 'ignore)

;;IMPORTANT this is just a bunch of shit ill organise this once i get the hang of it

;; those two lines make emacs not spill garbage all over your file system
;; no more #file# and file~ garbage
(setq auto-save-default nil)
(setq make-backup-files nil)


;; there is a bunch of ui shit by default this disables all of those
(tool-bar-mode -1)
(menu-bar-mode -1)
(tab-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
;; we like line numbers dont we ? 
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
;; 4 spaces is the only acceptable indentation

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)



;; this is just some code that evil gives you
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; make sure packages are only installed if you dont have them
(unless package-archive-contents (package-refresh-contents))

;; ---- download evil mode {


;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil magit php-mode)))

;; ---- download evil mode }
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#d3b58d" :background "#041818"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "#3fdflf"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white"))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))

;; vi mode for package list
(evil-set-initial-state 'package-menu-mode 'motion)

(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
