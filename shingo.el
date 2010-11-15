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
;(global-set-key [up] nil)
;(global-set-key [down] nil)
;(global-set-key [left] nil)
;(global-set-key [right] nil)

;; (setenv "ESHELL" (expand-file-name "~/bin/eshell"))

;; shell-mode
(defun shell ()
  (interactive)
  (ansi-term "/bin/zsh"))

(setq ruby-insert-encoding-magic-comment nil)

(load-file "~/Repositories/Terceiros/cucumber.el/feature-mode.el")
(load-file "~/Repositories/Terceiros/rvm.el/rvm.el")
(require 'rvm)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; geben debug
(add-to-list 'load-path "~/.emacs.d/vendor/geben-0.26")
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

;; Common desktop settings
(load "desktop.el")

;; (set-default-font "Bitstream Vera Sans Mono-11")
;; (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-11"))
(set-default-font "Inconsolata-13")
(add-to-list 'default-frame-alist '(font . "Inconsolata-13"))

;; (require 'rdebug)

;;
(custom-set-variables
   '(ispell-local-dictionary-alist
     (quote (("portugues" "[A-Za-zàèìòùÀÈÌÒÙáéíóúÁÉÍÓÚãõÃÕâêîôûÂÊÎÔÛçÇ]"
                          "[^A-Za-zàèìòùÀÈÌÒÙáéíóúÁÉÍÓÚãõÃÕâêîôûÂÊÎÔÛçÇ]"
                          "[-]" nil nil "~latin1" iso-8859-1)
             ("portutex"  "[A-Za-z\\\\\\\\]"
                          "[^A-Za-z\\\\\\\\]"
                          "[---~`'^{}]" nil nil "~tex" iso-8859-1)))))


;; twit.el
;;(add-to-list 'load-path "~/.emacs.d/vendor/twit.el/")

;;(autoload 'twit-show-recent-tweets	"twit" "" t) ; most recent direct tweets (!)
;;(autoload 'twit-show-at-tweets		"twit" "" t))  ; directed to you
;;(autoload 'twit-show-friends 		"twit" "" t))     ; your friends
;;(autoload 'twit-show-followers 		"twit" "" t) ; your followers

;;(autoload 'twit-follow-recent-tweets	"twit" "" t) ; at idle, check at background

;;(autoload 'twit-post			"twit" "" t)
;;(autoload 'twit-post-region		"twit" "" t)
;;(autoload 'twit-post-buffer		"twit" "" t)
;;(autoload 'twit-direct			"twit" "" t) ; tweet to person

;;(autoload 'twit-add-favorite		"twit" "" t) ; Add to favourite: (*) star
;;(autoload 'twit-remove-favorite 	"twit" "" t)

;;(autoload 'twit-add-friend  		"twit" "" t) ; follow a friend
;;(autoload 'twit-remove-friend 		"twit" "" t) ; emove a frienda

;; Customize twit-multi-accounts in order to use these: ((user . pass) ...)
;;(autoload 'twit-switch-account 		"twit" "" t)
;;(autoload 'twit-direct-with-account  	"twit" "" t)
;;(autoload 'twit-post-with-account 	"twit" "" t)

;;(autoload 'twit-show-direct-tweets-with-account "twit" "" t)
;;(autoload 'twit-show-at-tweets-with-account 	"twit" "" t)

;;(setq twit-user "shingonoide")
;; (setq twit-pass "pass")

;; Key bindings examples
;; Requires that autoloads above have been added to ~/.emacs

;;(global-set-key "\C-cTT"  'twit-follow-recent-tweets) ; (s)how (T)weets
;;(global-set-key "\C-cTst" 'twit-follow-recent-tweets) ; (s)how (t)weets
;;(global-set-key "\C-cTsa" 'twit-show-at-tweets)       ; (s)how (a)t
;;(global-set-key "\C-cTsf" 'twit-show-at-tweets)       ; (s)how (f)riends
;;(global-set-key "\C-cTsl" 'twit-show-at-tweets)       ; (s)how fo(l)lowers

;;(global-set-key "\C-cTpp" 'twit-post)		      ; (p)ost
;;(global-set-key "\C-cTpr" 'twit-post-region)	      ; (p)post (r)egion
;;(global-set-key "\C-cTpb" 'twit-post-buffer)	      ; (p)post (b)uffer
;;(global-set-key "\C-cTpr" 'twit-direct)		      ; (p)post (d)irect
;;(global-set-key "\C-cTfa" 'twit-add-favorite)	      ; (f)avorite (a)dd
;;(global-set-key "\C-cTfr" 'twit-remove-favorite)      ; (f)avorite (r)emove

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/vala"))
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; (add-hook 'vala-mode-hook #'wisent-csharp-default-setup)

(add-to-list 'load-path "~/.emacs.d/vendor/drupal")
; My PHP setup
(require 'setup-php)
(setup-php)

(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode")
(require 'rspec-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/po-mode")
(autoload 'po-mode "po-mode+"
  "Major mode for translators to edit PO files" t)
