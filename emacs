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
    (lua-mode company-c-headers autopair auto-complete-auctex auto-compile))))

;;Fullscreen
(toggle-frame-maximized)

;;TABSIZE
(setq c-default-style "linux"c-basic-offset 8)

;;UTF-8
(setq file-name-coding-system 'utf-8)

;;FONT
(add-to-list 'default-frame-alist '(font . "Roboto Mono -13"))

(windmove-default-keybindings 'meta) ;;навигация по буферам alt+\arrow keys\

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

(tooltip-mode      -1)
(scroll-bar-mode   -1)             ;;scroll bar
(tool-bar-mode     -1)             ;;tool bar
(menu-bar-mode     -1)             ;;menu bar
(toggle-scroll-bar -1)
(blink-cursor-mode -1)             ;;blink cursor
(setq use-dialog-box nil)          ;;minibufer only
(setq redisplay-dont-pause t)      ;;лучшая отрисовка минибуфера
(setq ring-bell-function 'ignore)  ;;отключить звуковой сигнал

;;KILL_WORD
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'compile)

;;Backup directory
(setq backup-directory-alist `(("." . "/home/nik/emacs_backup_files")))

;;WINDOW SIZE
;;(set-frame-size (selected-frame) 121 37)
;;(put 'set-goal-column 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p) ;; y/n вместо yes/no

;;MELPA
(require 'package)                 ;;start packege.el with emacs
;;add MELPA to repositori list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)               ;;initialize package.el

;;AUTOPAIR
(require 'autopair)                ;; курсор между скобок после их закрытия
(autopair-global-mode)
(add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))

;;LINE NUM PLAGIN
(require 'linum)                   ;; вызвать Linum
(line-number-mode   t)             ;; показать номер строки в mode-line
(global-linum-mode  t)             ;; показывать номера строк во всех буферах
(column-number-mode t)             ;; показать номер столбца в mode-line
(setq linum-format " %d")          ;; задаем формат нумерации

;;;;AUTOCOMPLETE
;;(require 'auto-complete)           ;;start auto-complete with emacs
;;(ac-config-default)                ;;dp default config for auto-complete

;;SNIPPETS
(require 'yasnippet)
(yas-global-mode 1)

;;COMPANY_MODE
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;NEO TREE
(add-to-list 'load-path "/home/nik/.config/emacs/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;LUA MODE
(require 'lua-mode)

;;C# MODE
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;;OMNISHARP
(require 'omnisharp-utils)
(require 'omnisharp-server-actions)
(require 'omnisharp-auto-complete-actions)
(require 'omnisharp-settings)
