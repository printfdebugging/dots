;; do't overwrite init.el
(make-temp-file "/tmp/emacs-custom")
(setq custom-file "/tmp/emacs-custom")


;; add package repositories
(setq
 package-archives '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
		    ("MELPA"        . "https://melpa.org/packages/")
		    ("ORG"          . "https://orgmode.org/elpa/")
		    ("MELPA Stable" . "https://stable.melpa.org/packages/")
		    ("nongnu"       . "https://elpa.nongnu.org/nongnu/"))

 package-archive-priorities '(("GNU ELPA"     . 20)
			      ("MELPA"        . 15)
			      ("ORG"          . 10)
			      ("MELPA Stable" . 5)
			      ("nongnu"       . 0)))

(package-initialize)


;; minimalist ui
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 0)

(setq inhibit-startup-screen t)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      initial-scratch-message "")

(defun display-startup-echo-area-message ()
  (message ""))


;; face customizations
(set-face-attribute 'default nil
		    :family "Iosevka Nerd Font"
		    :height 150)

(set-face-attribute 'fixed-pitch nil
		    :family "Iosevka Nerd Font"
		    :height 150)

(set-face-attribute 'variable-pitch nil
		    :family "Iosevka Nerd Font"
		    :height 150)



;; evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; theming and interface
(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t)
  (setq	doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-height 40)
  :hook (after-init . doom-modeline-mode))

;; vertico
;; Enable Vertico.
(use-package vertico
  :ensure t
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 10) ;; Show more candidates
  (vertico-resize nil) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

;; Emacs minibuffer configurations.
(use-package emacs
  :ensure t
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring
