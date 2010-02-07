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
(setq word-wrap t)

; no autofills please
(setq auto-fill-mode 0)

; Always highlight the current line
(global-hl-line-mode 1)

; format the title-bar to always include the buffer name
(setq frame-title-format (list "" "emacs" ": %f" ))

(setq auto-mode-alist (cons '("\\.mdwn$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.page$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.eml$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown$" . markdown-mode) auto-mode-alist))

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


(autoload 'todo-list-mode "todo-list-mode") ;load when needed
 
;a simple function that opens the file,
;and switches to todo-list-mode.
(defun open-todo-list ()
  (interactive)
  (find-file "~/TODO")
  (todo-list-mode))
 
;then bind to control-f12 so i can call it with one keystroke
;this works well for me because i also bind calendar to f12
;(global-set-key [C-f12] 'open-todo-list)

(setq auto-mode-alist (cons '("\\.todo$" . todo-list-mode) auto-mode-alist))

;; Time inserts
(defun insert-time ()
  "2007-09-03-20:54"
  (interactive)
  (insert (format-time-string "%Y-%m-%d-%R")))

;; ISO time
(defun insert-time-ISO ()
  "2007-09-03"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

;; Emacs macro to sort the todo list
(fset 'sort-todo
      [?\M-< ?\C-  ?\M-> ?\M-x ?s ?o ?r ?t ?- ?l ?i ?n ?e ?s return ?\M-<])

;; Build tags automatically
(setq rinari-tags-file-name "TAGS")

;; Unbind arrow keys to learn the emacs movement keys better
(global-set-key [up] nil)
(global-set-key [down] nil)
(global-set-key [left] nil)
(global-set-key [right] nil)

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))

;; shell-mode
(defun shell ()
  (interactive)
  (ansi-term "/bin/zsh"))

(setq ruby-insert-encoding-magic-comment nil)

(load-file "~/Repositories/Terceiros/cucumber.el/feature-mode.el")

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; geben debug
;; (add-to-list 'load-path "/Users/shingo/elisp/geben")
;; (add-to-list 'load-path "/Users/shingo/elisp/geben/gud")

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

;; (autoload 'geben "geben" "PHP Debugger on Emacs" t)


;; (load-file "~/.emacs.d/elpa/emms-3.0/emms.el")
;; (require 'emms-setup) (emms-devel) (emms-default-players)

;; (global-set-key (kbd "C-c <up>") 'emms-start)
;; (global-set-key (kbd "C-c <down>") 'emms-stop)
;; (global-set-key (kbd "C-c <left>") 'emms-previous)
;; (global-set-key (kbd "C-c <right>") 'emms-next)

;; (add-to-list 'load-path "~/elisp/ecb/")
;; (load-file "~/elisp/ecb/ecb.el")
;; (require 'ecb)

;; wanderlust
;;(autoload 'wl "wl" "Wanderlust" t)
;;(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;;(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
;;(setq elmo-imap4-default-server "imap.gmail.com")
;;(setq elmo-imap4-default-user "shingonoide@gmail.com") 
;;(setq elmo-imap4-default-authenticate-type 'clear) 
;;(setq elmo-imap4-default-port '993)
;;(setq elmo-imap4-default-stream-type 'ssl)

;;(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP
;;(setq wl-smtp-connection-type 'starttls)
;;(setq wl-smtp-posting-port 587)
;;(setq wl-smtp-authenticate-type "plain")
;;(setq wl-smtp-posting-user "shingonoide")
;;(setq wl-smtp-posting-server "smtp.gmail.com")
;;(setq wl-local-domain "gmail.com")

;;(setq wl-default-folder "%inbox")
;;(setq wl-default-spec "%")
;;(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
;;(setq wl-trash-folder "%[Gmail]/Trash")

;;(setq wl-folder-check-async t) 

;;(setq elmo-imap4-use-modified-utf7 t)

;;(autoload 'wl-user-agent-compose "wl-draft" nil t)
;;(if (boundp 'mail-user-agent)
;;    (setq mail-user-agent 'wl-user-agent))
;;(if (fboundp 'define-mail-user-agent)
;;    (define-mail-user-agent
;;      'wl-user-agent
;;      'wl-user-agent-compose
;;      'wl-draft-send
;;      'wl-draft-kill
;;      'mail-send-hook))
