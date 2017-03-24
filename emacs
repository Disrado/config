(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (redo+ persistent-soft projectile sr-speedbar ido-at-point flycheck-clangcheck lua-mode company-c-headers autopair auto-complete-auctex auto-compile))))

(add-to-list 'load-path "~/.emacs.d/lisp/redo+/")

;;Backup directory
(setq backup-directory-alist `(("." . "/home/nik/emacs_backup_files")))

;;Fullscreen
(toggle-frame-maximized)

;;Kill bars
(tooltip-mode      -1)
(scroll-bar-mode   -1)             ;;scroll bar
(tool-bar-mode     -1)             ;;tool bar
(menu-bar-mode     -1)             ;;menu bar
(toggle-scroll-bar -1)

;;TABSIZE
(setq c-default-style "linux"c-basic-offset 8)

;;FONT
(add-to-list 'default-frame-alist '(font . "Roboto Mono -12"))
(set-default-font "Roboto Mono -12")

;;ENCODING
(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read    'utf-8)
(setq file-name-coding-system           'utf-8)
(set-selection-coding-system            'utf-8)
(set-keyboard-coding-system        'utf-8-unix)
(set-terminal-coding-system             'utf-8)
(prefer-coding-system                   'utf-8)

;; Scrolling settings
(setq scroll-step       1)         ;; вверх-вниз по 1 строке
(setq scroll-margin    8)         ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от границы  
(setq scroll-conservatively 10000)

;;Disable blink cursor
(blink-cursor-mode -1)

(setq use-dialog-box nil)          ;;minibufer only
(setq redisplay-dont-pause t)      ;;лучшая отрисовка минибуфера
(setq ring-bell-function 'ignore)  ;;отключить звуковой сигнал

;;Simple answer
(fset 'yes-or-no-p 'y-or-n-p) ;; y/n вместо yes/no

;;Reopen copile buffer
(defun my-recompile ()
  (interactive)
  (progn
    (if (get-buffer "*compilation*") ; If old compile window exists
  	(progn
  	  (delete-windows-on (get-buffer "*compilation*"))
  	  (kill-buffer "*compilation*")
  	  )
        )
    (call-interactively 'compile)
    )
  )

(global-unset-key (kbd "M-S-l"))

;;Keydindings
(defun my-keybindings (my-key-map)
  (define-key my-key-map (kbd "M-j") 'backward-char)
  (define-key my-key-map (kbd "M-;") 'forward-char)
  (define-key my-key-map (kbd "M-k") 'previous-line)
  (define-key my-key-map (kbd "M-l") 'next-line)
  
  (define-key my-key-map (kbd "C-j") 'backward-word)
  (define-key my-key-map (kbd "C-;") 'forward-word)
  
  (define-key my-key-map (kbd "M-h") 'beginning-of-line)
  (define-key my-key-map (kbd "M-'") 'end-of-line)

  (define-key my-key-map (kbd "C-l") 'company-select-next)
  (define-key my-key-map (kbd "C-k") 'company-select-previous)
  
  (define-key my-key-map (kbd "M-C-k") 'beginning-of-buffer)
  (define-key my-key-map (kbd "M-C-l") 'end-of-buffer)
  
  (define-key my-key-map (kbd "M-d") 'delete-char)
  (define-key my-key-map (kbd "M-w") 'delete-backward-char)
  (define-key my-key-map (kbd "C-d") 'kill-word)
  (define-key my-key-map (kbd "C-w") 'backward-kill-word)
  (define-key my-key-map (kbd "C-f") 'kill-line)
  
;;  (define-key my-key-map (kbd "M-m") 'set-mark-command)
  
  (define-key my-key-map (kbd "M-x") 'kill-region)
  (define-key my-key-map (kbd "M-c") 'copy-region-as-kill)
  (define-key my-key-map (kbd "M-v") 'yank)
  
  (define-key my-key-map (kbd "C-/") 'undo)
  (define-key my-key-map (kbd "C-.") 'redo)
  
  (define-key my-key-map (kbd "M-C-s") 'save-buffer)
  (define-key my-key-map (kbd "C-o") 'find-file)

  (define-key my-key-map (kbd "C-u") 'switch-to-next-buffer)
  (define-key my-key-map (kbd "C-p") 'switch-to-prev-buffer)

  (define-key my-key-map (kbd "C-n") 'newline)
  
  ;;(define-key my-key-map (kbd "") ')

  (global-set-key (kbd "M-,") 'hs-toggle-hiding)
  (global-set-key (kbd "C-,") 'hs-hide-all)
  (global-set-key (kbd "C-M-,") 'hs-show-all)
  
  (global-set-key (kbd "<f5>") 'my-recompile)
  )

(my-keybindings (current-global-map))

;;Undo-Redo system
(require 'redo+)

;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;;Ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;Buffer show
(require 'bs)
(global-set-key (kbd "<f2>") 'bs-show)

;;Sr-speedbar
(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)

;;Projectile
(require 'projectile)
(projectile-mode 1)

;;Folding
(defvar hs-special-modes-alist
  (mapcar 'purecopy
	  '((c-mode "{" "}" "/[*/]" nil nil)
	    (c++-mode "{" "}" "/[*/]" nil nil)
	    (emacs-lisp- "(" ")" nil))))

(require 'hideshow)
(add-hook 'c-mode-common-hook   'hs-minor-mode)

;;FLYCHECK
(require 'package)
(flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++14")))

;;AUTOPAIR
(require 'autopair)                ;; курсор между скобок после их закрытия
(autopair-global-mode)
(add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))

;;Linum
(require 'linum);; вызвать Linum
(setq linum-format "%d")          ;; задаем формат нумерации
(line-number-mode   t)             ;; показать номер строки в mode-line
(global-linum-mode  t)             ;; показывать номера строк во всех буферах
(column-number-mode t)             ;; показать номер столбца в mode-line

;;SNIPPETS
(require 'yasnippet)
(yas-global-mode 1)

;;COMPANY_MODE
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;LUA MODE
(require 'lua-mode)
(custom-set-faces)
