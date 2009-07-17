; Colors
; http://www.cs.cmu.edu/~maverick/GNUEmacsColorThemeTest/
(load "color-theme-library")
(color-theme-lss)

; Re-read a buffer from disk
(global-set-key (kbd "<f5>") 'revert-buffer)

; Search tags
(global-set-key [(control tab)] 'find-tag)

; Indent with spaces
(setq-default indent-tabs-mode nil)

; Set current tabs to 2
(setq default-tab-width 2)

; Syntax highlight please
(global-font-lock-mode t)

; Spel check comments
(setq-default flyspell-prog-mode t)

; Magic Function to chmod +x anyfile that starts with a hashbang
; http://rubygarden.org/ruby?InstallingEmacsExtensions
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

; No scroll please
(scroll-bar-mode -1)

;; Always wordwrap
(setq truncate-partial-width-windows nil)

; no autofills please
(setq auto-fill-mode 0)

; format the title-bar to always include the buffer name
(setq frame-title-format (list "" "emacs" ": %f" ))

(setq auto-mode-alist (cons '("\\.mdwn$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.page$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.eml$" . markdown-mode) auto-mode-alist))


;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; (load-file "~/elisp/cedet-1.0pre6/common/cedet.el")


;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)


;; Tab completion
;; http://www.emacsblog.org/2007/03/12/tab-completion-everywhere/
(global-set-key [(tab)] 'smart-tab)
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (dabbrev-expand nil)
        (indent-for-tab-command)))))


(add-to-list 'auto-mode-alist '("\\.liquid$" . nxhtml-mode))
(setenv "ESHELL" (expand-file-name "~/bin/eshell"))

;; shell-mode
(defun shell ()
  (interactive)
  (ansi-term "/bin/zsh"))

;; geben debug
(add-to-list 'load-path "/Users/shingo/elisp/geben")
(add-to-list 'load-path "/Users/shingo/elisp/geben/gud")


(autoload 'geben "geben" "PHP Debugger on Emacs" t)

;; (load-file "~/.emacs.d/elpa/emms-3.0/emms.el")
;; (require 'emms-setup) (emms-devel) (emms-default-players)

;; (global-set-key (kbd "C-c <up>") 'emms-start)
;; (global-set-key (kbd "C-c <down>") 'emms-stop)
;; (global-set-key (kbd "C-c <left>") 'emms-previous)
;; (global-set-key (kbd "C-c <right>") 'emms-next)


;; (add-to-list 'load-path "~/elisp/ecb/")
;; (load-file "~/elisp/ecb/ecb.el")
;; (require 'ecb)

