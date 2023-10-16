;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(bubbles-game-theme (quote easy))
 '(bubbles-graphics-theme (quote circles))
 '(custom-enabled-themes (quote (manoj-dark)))
 '(org-agenda-files (quote ("/media/machine/D/org/")))
 '(package-selected-packages
   (quote
    (markdown-mode org-ref ivy hydra dash org yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -*- mode: elisp -*-
;; more packages from melpa
;;(require 'package)


;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; evaluate python in org mode code-blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (latex . t)))

;;; org-ref
(require 'org-ref)
;;(setq bibtex-completion-bibliography "/media/machine/D/org/library.bib")
(setq reftex-default-bibliography '("/media/machine/D/org/references/library.bib"))
(setq org-ref-default-bibliography '("/media/machine/D/org/references/library.bib"))
;;(setq org-ref-pdf-directory '("/media/machine/D/papers"))

;; process latex file multiple times to get the references right
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; ====================
;; insert date and time

(defvar current-date-time-format "%Y%m%d%H%M"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-date-format "%Y%m%d"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")


(defvar current-time-format "%H%M"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert (format-time-string current-date-time-format (current-time)))
       )

(defun insert-current-date ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert (format-time-string current-date-format (current-time)))
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       )

(global-set-key "\C-x\+" 'insert-current-date-time)
(global-set-key "\C-x\/" 'insert-current-date)
(global-set-key "\C-x\-" 'insert-current-time)

;; enables easy org-stucture template blocks 
(require 'org-tempo)
;; keybindings are
;; source code <s TAB
;; quote block <q TAB
;; latex block <l TAB
;; html block <h TAB

;; change the org-todo states globally
;; taken from org manual and https://www.reddit.com/r/orgmode/comments/dpk84w/done_tasks_with_different_color/
(setq org-todo-keywords
      '((sequence "TODO" "CANCELED" "WAIT" "DELEGATED" "DOING" "DONE" ))
      )
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "Red" :weight bold))
        ("WAIT" . (:foreground "DarkOrange" :weight bold))
        ("DOING" . (:foreground "White" :weight bold))
        ("DONE" . (:foreground "PaleGreen" :weight bold))
	("DELEGATED" . (:foreground "DarkViolet" :weight bold))
        ("CANCELED" . (:foreground "SlateGray" :weight bold))
        )
      )

;; snippet plugin: yasnippet installed from https://elpa.gnu.org/packages/yasnippet.html
(yas-global-mode 1)
;; (org-ref 1)

;; changing the org-capture location
(setq org-default-notes-file "/media/machine/D/org/notes.org")

;; org achive location
;; archive using C-c $ or using C-c C-x C-s
;;(setq org-archive-location "/media/machine/D/org/archive.org")

;; closing time stamp for done items
(setq org-log-done 'time)


;; autofill the link description while inserting links
;; reference: https://gist.github.com/jmn/34cd4205fa30ccf83f94cb1bc0198f3f
;; How to make org-mode org-insert-link (C-c C-l) automatically fill in the description from a webpage:

(defun jmn/url-get-title (url &optional descr)
  "Takes a URL and returns the value of the <title> HTML tag,
   Thanks to https://frozenlock.org/tag/url-retrieve/ for documenting url-retrieve"
  (let ((buffer (url-retrieve-synchronously url))
        (title nil))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (search-forward-regexp "<title>\\([^<]+?\\)</title>")	
      (setq title (match-string 1 ) )
      (kill-buffer (current-buffer)))
    title))

(setq org-make-link-description-function 'jmn/url-get-title)
