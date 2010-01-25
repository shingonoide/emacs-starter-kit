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
(setq default-tab-width 4)

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
      [?\M-< ?\C-  ?\M-> ?\M-x ?s ?o ?r ?t ?- ?l ?i ?n ?e ?s return])

;; Build tags automatically
(setq rinari-tags-file-name "TAGS")