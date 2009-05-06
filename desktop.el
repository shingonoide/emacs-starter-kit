;; emacsclient

; Finish editing on a client
(global-set-key (kbd "C-c x") 'server-edit)

(add-hook 'server-switch-hook
          (lambda nil
            (let ((server-buf (current-buffer)))
              (bury-buffer)
              (switch-to-buffer-other-frame server-buf))))

(add-hook 'server-done-hook 'delete-frame)

; Remove the server socket when emacs exits.  Had to shell out because
; delete-file was returning "/tmp/emacs1000/server: No such device or address"
;
; Based on code from:
;
; http://github.com/stsquad/my-emacs-stuff/blob/af57d1707881b23f05bb89dc926dc8a2b08addb3/my-emacs-server.el
;
(defun is-server-running ()
  "Check is an emacs-server process is already running"
  (let ((socket-path (concat server-socket-dir "/server")))
    (file-exists-p socket-path)))

(defun my-server-kill-emacs-hook ()
  "Clean up server files when we exit"
  (if (is-server-running)
      (call-process "/bin/rm" nil nil nil (concat server-socket-dir "/server"))))

(add-hook 'kill-emacs-hook
          (lambda ()
            (my-server-kill-emacs-hook)))

(unless (is-server-running)
  (server-start))


;; Changing font sizes
;; http://sachachua.com/wp/2006/09/15/emacs-changing-the-font-size-on-the-fly/
(defun sacha/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun sacha/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))
(global-set-key (kbd "C-C +") 'sacha/increase-font-size)
(global-set-key (kbd "C-C -") 'sacha/decrease-font-size)
