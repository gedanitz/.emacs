;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable keybindings

(require 'paredit)

(util/define-keys paredit-mode-map
  "C-M-n"       nil
  "C-M-p"       nil
  "M-s"         nil
  "M-;"         nil
  "M-:"         nil
  "C-j"         nil
  "C-M-<left>"  nil
  "C-M-<right>" nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hooks

(dolist (mode '(emacs-lisp-mode-hook
                lisp-mode-hook
                geiser-mode-hook
                geiser-repl-mode-hook
                clojure-mode-hook
                cider-mode-hook
                cider-repl-mode-hook))

  (add-hook mode 'paredit-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--paredit)
