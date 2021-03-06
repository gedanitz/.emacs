(add-to-list 'load-path "~/.emacs.d/site-lisp")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages

(require 'setup--package)
(require 'util--package)

(util--package/install-packages! '(dash
                                   elscreen
                                   magit
                                   ;; ssh-agency

                                   ;; ido
                                   idomenu
                                   ido-vertical-mode
                                   ido-ubiquitous
                                   crm-custom
                                   smex
                                   swiper
                                   counsel

                                   ;;Projectile
                                   projectile

                                   ;; Sexp
                                   paredit
                                   paxedit

                                   ;; Editing
                                   expand-region
                                   multiple-cursors

                                   ;; Lang: Clojure
                                   clojure-mode
                                   cider
                                   clj-refactor
                                   cider-eval-sexp-fu
                                   nrepl-eval-sexp-fu
                                   align-cljlet
                                   popup

                                   ;; Lang: VB(S)


                                   ;;Misc
                                   company
                                   company-quickhelp

                                   ;; Appearance
                                   rainbow-delimiters
                                   noctilux-theme
                                   ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basics

(require 'util)
(require 'setup--osx)
(require 'setup--sane-defaults)
(require 'setup--appearance)
(require 'setup--scrolling)
(require 'setup--rainbow-delimiters)
(require 'setup--noctilux-theme)

(util/global-set-keys
  "C-w"     'backward-kill-word
  "C-h"     'backward-delete-char-untabify
  "M--"     'set-mark-command
  "M-\\"    'help
  "M-0"     'back-to-indentation
  "C-x C-s" 'util/save-all-buffers!
  "M-j"     'util/join-line
  "M-o"     'util/window-toggle
  "M-;"     'util/comment
  "M-l"     'util/switch-to-previous-buffer
  "M-."     nil
  "C-x f"   'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc

(util/global-unset-keys
 "M-SPC"
 "C-c M-j")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quickly open files

(util/global-set-keys
 "M-SPC e" (util/open-file "~/.emacs.d/init.el")
 "M-SPC t" (util/open-file "h:/work/TODO.org")
 "M-SPC i" (util/open-file "k:/Doctronic/Ausbildung/Themenrunde/_Themenliste.txt"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elscreen

(require 'setup--elscreen)
(require 'util--elscreen)

(util/global-set-keys
  "M-P" 'elscreen-previous
  "M-N" 'elscreen-next
  "M-X" 'elscreen-kill
  "M-C" 'util--elscreen/create)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit

;; (require 'ssh-agency)

(require 'magit)

(util/global-set-keys
  "M-SPC L" 'magit-log-all
  "M-SPC l" 'magit-log-current
  "M-SPC s" 'magit-status)

(magit-define-popup-action
  'magit-push-popup
  ?P
  "Push implicitly"
  'magit-push-implicitly)

;; (setenv "SSH_ASKPASS" "git-gui--askpass")

;; (setenv "SSH_GIT" "C:/PuTTy/plink.exe")

;; (shell-command-to-string (concat (getenv "SSH_GIT") " -V"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ido

(require 'setup--ido)

(util/global-set-keys
  "M-a" 'idomenu
  "M-s" 'ido-switch-buffer)

(add-hook 'ido-setup-hook
          (lambda ()
            (util/define-keys ido-file-completion-map
              "C-w" 'ido-delete-backward-updir)

            (util/define-keys ido-common-completion-map
              "SPC" 'ido-restrict-to-matches
              "C-j" 'ido-next-match
              "C-k" 'ido-prev-match)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smex

(require 'setup--smex)

(util/global-set-keys
  "M-x" 'setup--smex/run-smex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Swiper / Counsel
;; Keybindigns M-n M-p ivy-history
;; C-M-n ivy-next-line-and-call

(require 'swiper)

(setq ivy-height 13)

(util/global-set-keys
  "M-h" 'swiper
  "M-H" 'counsel-git-grep)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile

(require 'setup--projectile)

(util/global-set-keys
  "C-x C-x" 'projectile-find-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paredit

(require 'setup--paredit)

(util/define-keys paredit-mode-map
  "M-i"   'paredit-reindent-defun
  "C-M-c" 'paredit-close-round
  "C-M-i" 'paredit-forward-down
  "C-c b" 'backward-kill-sexp
  "C-c B" 'paredit-splice-sexp-killing-backward
  "M-{"   'paredit-wrap-curly
  "M-["   'paredit-wrap-square)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Expand region

 (util/global-set-keys
   "M-." 'er/expand-region
   "M-," 'er/contract-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Multiple Cursors

(util/global-set-keys
  "M-1" 'mc/mark-previous-like-this
  "M-2" 'mc/mark-next-like-this
  "M-3" 'mc/mark-all-like-this
  "M-4" 'mc/edit-lines
  "M-\"" 'mc/skip-to-next-like-this
  "M-!" 'mc/skip-to-previous-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure

(require 'setup--clojure)
(require 'util--clojure)

;; Cljr Prefix
(cljr-add-keybindings-with-prefix "C-c r")

;; Global
(util/global-set-keys
  "C-c >" 'cider-connect
  "C-c <" 'cider-quit)

;; Cider
(util/define-keys cider-mode-map
  "C-c C-c" (lambda ()
              (interactive)
              (util/save-all-buffers!)
              (cider-interactive-eval "(do (require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh-all))"))
  "C-c e"   'util--clojure/eval-form-in-repl
  "M-e"     'util--clojure/eval-form
  "C-M-x"   'util--clojure/eval-form
  "C-c TAB" 'util--clojure/insert-region-or-last-sexp-into-repl
  "C-t"     'cider-switch-to-repl-buffer)

;;  Cider Repl
(util/define-keys cider-repl-mode-map
  "C-t"   'cider-switch-to-last-clojure-buffer
  ;; C-j?
  "C-RET" 'cider-repl-newline-and-indent)

;; Cider / Cider Repl
(util/define-keys (list cider-mode-map cider-repl-mode-map)
  "C-c a"   'cider-interrupt
  "C-c g"   'cider-grimoire
  "C-c C-j" 'cider-find-var
  "C-c C-b" 'cider-jump-back
  "C-c d"   'cider-doc
  "C-c s"   'util--clojure/visit-error-buffer
  "C-M-e"   'util--clojure/end-of-defun
  "C-c C-r" 'util--clojure/eval-and-replace-region-or-last-sexp
  "C-c h"   'util--clojure/popup-doc
  "C-c i"   (util/all-buffers-saved (util--clojure/cider-cmd "(user/system-restart!)"))
  "C-c k"   (util/all-buffers-saved (util--clojure/cider-cmd "(user/system-stop!)"))
  "C-c I"   (util--clojure/cider-cmd "(do (require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh-all))"))

;; Cider Test
(util/define-keys cider-test-report-mode-map
  "M-j" 'cider-test-jump)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paxedit

(require 'setup--paxedit)

(defvar paxedit-keys '(("k" . 'paxedit-transpose-backward)
                       ("j" . 'paxedit-transpose-forward)
                       ("d" . 'paxedit-kill)))

(util/define-keys emacs-lisp-mode-map
  "C-c j" paxedit-keys)

(util/define-keys clojure-mode-map
  "C-c j" paxedit-keys)

(util/define-keys (list emacs-lisp-mode-map
                        cider-mode-map)
  "C-M-j" 'paxedit-transpose-forward
  "C-M-k" 'paxedit-transpose-backward)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company

(require 'setup--company)

(util/global-set-keys
  "\t" 'company-complete-common)

;; C-n/C-p -> up/down
(util/define-keys company-active-map
  "\C-n"  'company-select-next
  "\C-p"  'company-select-previous
  "\C-d"  'company-show-doc-buffer
  "\C-v"  'company-show-location
  "<tab>" 'company-complete
  "\C-g"  'company-abort
  "M-h"   'company-quickhelp-manual-begin)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RecentF

(require 'setup--recentf)

(util/global-set-keys
  "C-x f" 'recentf-open-files)
