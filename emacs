(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t))

;;(custom-set-faces)
;;tabsize
(setq c-default-style "linux"c-basic-offset 8)

;;UTF-8
(setq file-name-coding-system 'utf-8)

;;font
(add-to-list 'default-frame-alist '(font . "Roboto Mono -13"))

(windmove-default-keybindings 'meta) ;;навигация по буферам alt+\arrow keys\

;;(setq-default c-basic-offset 4)

;; Indent settings
;;(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
;;(setq-default c-basic-offset     4)
;;(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа

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
(setq scroll-margin    10)         ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от границы  
(setq scroll-conservatively 10000)


;; Line num plugin
(require 'linum)                   ;; вызвать Linum
(line-number-mode   t)             ;; показать номер строки в mode-line
(global-linum-mode  t)             ;; показывать номера строк во всех буферах
(column-number-mode t)             ;; показать номер столбца в mode-line
(setq linum-format " %d")          ;; задаем формат нумерации

;; AUTOCOMPLETE
(require 'package)                 ;;start packege.el with emacs
;;add MELPA to repositori list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)               ;;initialize package.el
(require 'auto-complete)           ;;start auto-complete with emacs
(ac-config-default)                ;;dp default config for auto-complete

;; SNIPPETS
;;start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(tooltip-mode      -1)
(scroll-bar-mode   -1)             ;;scroll bar
(tool-bar-mode     -1)             ;;tool bar
(menu-bar-mode     -1)             ;;menu bar
(blink-cursor-mode -1)             ;;blink cursor
(setq use-dialog-box nil)          ;;minibufer only
(setq redisplay-dont-pause t)      ;;лучшая отрисовка минибуфера
(setq ring-bell-function 'ignore)  ;;отключить звуковой сигнал

;;WINDOW SIZE
(set-frame-size (selected-frame) 121 37)
(put 'set-goal-column 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p) ;; y/n вместо yes/no

 ;; Set transparency of emacs
(defun transparency (value)
"Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 40 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

;;KILL_WORD
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region) 
