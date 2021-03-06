;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; Programming features
     (auto-completion :variables
                      auto-completion-enable-help-tooltip nil)
     (lsp :variables
          lsp-navigation 'peek
          ;; lsp-print-performance t
          ;; lsp-enable-file-watchers t
          lsp-ui-doc-enable nil
          lsp-enable-indentation nil
          lsp-enable-on-type-formatting nil
          lsp-signature-auto-activate nil
          )
     (cmake :variables
            cmake-enable-cmake-ide-support t
            )
     syntax-checking
     debug
     git
     ;; Languages
     (c-c++ :variables
            c-c++-adopt-subprojects t
            c-c++-backend 'lsp-ccls
            c-c++-lsp-semantic-highlight-method 'overlay
            )
     (rust :variables
           rust-backend 'racer
           )
     org
     emacs-lisp
     markdown
     (python :variables
             python-backend 'lsp
             python-eldoc-get-doc nil
             )
     nixos
     (latex :variables
            latex-build-command "xelatex"
            latex-enable-auto-fill t
            latex-enable-folding t
            latex-enabe-magic t)
     ;; making emacs great again
     treemacs
     helm
     ranger
     ;; allmighty shell
     (shell :variables
            shell-default-height 30
            shell-default-shell 'eshell
            shell-default-position 'bottom
            )
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark-even-darker-now
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.1)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (spacemacs/set-default-font dotspacemacs-default-font)
  (setq-default git-magit-status-fullscreen t)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Transparenz
  (spacemacs/enable-transparency)
  (add-hook 'after-make-frame-functions 'spacemacs/enable-transparency)
  ;; JK als Escape-Sequenz
  (setq-default evil-escape-key-sequence "jk")
  ;; Enter für newline
  (define-key evil-normal-state-map (kbd "RET")
    (lambda ()
      (interactive)
      (call-interactively 'spacemacs/evil-insert-line-above)
      (evil-next-line)))
  ;; Custom Window Kram
  (define-key global-map (kbd "M-h") 'windmove-left)
  (define-key global-map (kbd "M-j") 'windmove-down)
  (define-key global-map (kbd "M-k") 'windmove-up)
  (define-key global-map (kbd "M-l") 'windmove-right)
  ;; Custom Kommentar kram
  (define-key evil-normal-state-map (kbd "-") 'evilnc-comment-operator)
  (define-key evil-visual-state-map (kbd "-") 'evilnc-comment-operator)
  ;; Spaces am Ende entfernen
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; Python doc deaktivieren
  ;; (remove-hook 'python-mode-hook 'spacemacs//init-eldoc-python-mode)
  ;; go-to-definition im c++ mode über rtags
  (define-key evil-normal-state-map (kbd "gd") 'xref-find-definitions)
  ;; Eigenes Menü mit "SPC+o"
  (spacemacs/declare-prefix "o" "own stuff")
  (spacemacs/set-leader-keys "op" 'org-pomodoro)
  (spacemacs/set-leader-keys "oc" 'cmake-ide-compile)
  (spacemacs/set-leader-keys "oC" 'cmake-ide-run-cmake)
  (spacemacs/set-leader-keys "or" 'projectile-run-project)
  ;; Fancy-Auto-Alignment
  ;; (defun align-regexp-between (start end regexpBefore regexpAfter)
  ;;   "Repeat alignment with respect to the given regular expression."
  ;;   (interactive "r\nsAlign regexp before: \nsAlign regexp after: ")
  ;;   (align-regexp start end
  ;;                 (concat regexpBefore "\\(\\s-*\\)" regexpAfter) 1 1 t))
  (defun align-regexp-between (start end regexpAfter)
    "Repeat alignment with respect to the given regular expression."
    (interactive "r\nsAlign regexp after: ")
    (align-regexp start end
                  (concat "" "\\(\\s-*\\)" regexpAfter) 1 1 t))

  (define-key evil-visual-state-map (kbd "q") 'align-regexp-between)
  ;; Damit wir alt (option) verwenden können:
  (setq mac-option-key-is-meta nil
        mac-option-modifier 'none)
  ;; Auto-Formatierung von C-Code
  ;; C-Style Anpassungen
  (setq-default
   c-default-style "bsd"
   c-basic-offset 3
   )
  ;; Keine Lockfiles
  (setq create-lockfiles nil)
  ;; Ranger stuff
  (setq ranger-max-parent-width 0.12)
  (setq ranger-width-parents 0.12)
  (setq ranger-width-preview 0.55)
  (setq ranger-parent-depth 1)
  (setq ranger-max-preview-size 10)
  ;; Projectile
  (setq projectile-require-project-root t)
  (setq projectile-indexing-method 'alien)
  (setq projectile-project-root-files '( ".dir-locals.el" "Makefile" "CMakeLists.txt"))
  (setq projectile-project-root-files-functions '(projectile-root-top-down
                                                  projectile-root-top-down-recurring
                                                  projectile-root-bottom-up
                                                  projectile-root-local))
  ;; Org-Stuff
  (setq org-todo-keywords '((sequence "TODO" "PROGRESS" "TERMIN:" "|" "DONE" "CANCELLED")))
  (setq powerline-default-separator 'arrow)
  ;; Speed me up
  ;; (setq company-candidates-cache 'auto)
  ;; please use latest c++ standard
  (add-hook 'c-mode-hook
            (lambda ()
              (setq flycheck-clang-language-standard "c17")))
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq flycheck-clang-language-standard "c++17")))
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (lsp-treemacs-sync-mode 1)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (company-reftex company-auctex auctex wgrep smex ivy-yasnippet ivy-xref ivy-rtags ivy-purpose ivy-hydra counsel swiper ivy nix-mode helm-nixos-options company-nixos-options nixos-options company-racer ac-racer toml-mode racer flycheck-rust cargo rust-mode realgud test-simple loc-changes load-relative typit mmt sudoku pacmacs 2048-game yapfify xterm-color vterm treemacs-magit smeargle shell-pop pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-brain multi-term mmm-mode markdown-toc magit-svn magit-gitflow magit-popup lsp-python-ms live-py-mode importmagic epc ctable concurrent htmlize helm-pydoc helm-org-rifle helm-org helm-gitignore helm-git-grep gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-org evil-magit magit transient git-commit with-editor eshell-z eshell-prompt-extras esh-help cython-mode company-anaconda blacken anaconda-mode pythonic ranger helm-ctest cmake-mode cmake-ide levenshtein dap-mode bui tree-mode yasnippet-snippets lsp-ui lsp-treemacs helm-rtags helm-lsp helm-company helm-c-yasnippet google-c-style fuzzy flycheck-ycmd flycheck-rtags flycheck-pos-tip pos-tip disaster cquery cpp-auto-include company-ycmd ycmd request-deferred deferred company-statistics company-rtags rtags company-lsp company-c-headers company clang-format ccls lsp-mode markdown-mode dash-functional auto-yasnippet yasnippet ac-ispell auto-complete ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen treemacs-projectile treemacs-evil treemacs ht pfuture toc-org symon symbol-overlay string-inflection spaceline-all-the-icons spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile projectile helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck pkg-info epl let-alist flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump doom-modeline shrink-path all-the-icons memoize f dash s devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el org-plus-contrib hydra lv hybrid-mode font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(safe-local-variable-values
   (quote
    ((cmake-ide-build-dir . "~/Projekte/loadrunner/bodensensor/build")
     (projectile-project-run-cmd . "./build/mThread")
     (projectile-project-name . "mThread")
     (projectile-project-run-cmd . "./build/release/cvCuda_test")
     (projectile-project-name . "cvCuda_test")
     (projectile-project-run-cmd . "./build/release/nix_test")
     (projectile-project-name . "nix_test")
     (cmake-ide-build-dir . "~/Projekte/ueye/navcam/build/release")
     (cmake-ide-project-dir . "~/Projekte/ueye/navcam")
     (projectile-compilation-dir . "~/Projekte/loadrunner/bodensensor")
     (projectile-project-root . "~/Projekte/loadrunner/bodensensor")
     (projectile-project-run-cmd . "build/release/bodensensor")
     (helm-make-build-dir . "build")
     (projectile-project-run-cmd . "./build/bodensensor")
     (cmake-ide-cmake-opts . "-DCMAKE_BUILD_TYPE=Release
 -DLIBSERIAL_ENABLE_TESTING=OFF
 -DLIBSERIAL_BUILD_EXAMPLES=OFF
 -DLIBSERIAL_PYTHON_ENABLE=OFF
 -DLIBSERIAL_BUILD_DOCS=OFF
 -DINSTALL_SHARED=OFF
 -DMQTT_BUILD_EXAMPLES=OFF
 -DMQTT_BUILD_TESTS=OFF
 -DJSON_BuildTests=OFF
 -Dnanopb_BUILD_GENERATOR=OFF
 -DCMAKE_BUILD_TYPE=$btype
 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -j12")
     (cmake-ide-build-dir . "build/release")
     (cmake-ide-project-dir . "~/Projekte/loadrunner/loadrunner-nano-bridge/localization-bridge")
     (projectile-project-run-cmd . "./build/release/bodensensor")
     (projectile-project-name . "bodensensor")
     (cmake-ide-build-dir . "~/Projekte/loadrunner/bodensensor/build/release")
     (cmake-ide-project-dir . "~/Projekte/loadrunner/bodensensor")
     (helm-make-arguments . "-j12 -03 -Wall")
     (projectile-project-run-cmd . "./build/release/test")
     (projectile-project-name . "test")
     (cmake-ide-cmake-opts . "-DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -j12 -03 -Wall")
     (cmake-ide-build-dir . "~/Projekte/c++testbed/test/build/release")
     (cmake-ide-project-dir . "~/Projekte/c++testbed/test")
     (cmake-ide-build-dir . "~/Projekte/c++testbed/sandbox/build")
     (cmake-ide-project-dir . "~/Projekte/c++testbed/sandbox")
     (cmake-ide-build-dir . "~/Projekte/c++testbed/openvxTest/build")
     (cmake-ide-project-dir . "~/Projekte/c++testbed/openvxTest")
     (cmake-ide-build-dir . "~/Projekte/c++testbed/mqttClient/build/release")
     (cmake-ide-project-dir . "~/Projekte/c++testbed/mqttClient")
     (cmake-ide-build-dir . "~/Projekte/c++testbed/doublebuffer/build/release")
     (cmake-ide-project-dir . "~/Projekte/c++testbed/doublebuffer")
     (projectile-project-run-cmd . "./build/release/doublebuffer")
     (projectile-project-name . "doublebuffer")
     (projectile-project-run-cmd . "./build/release/ueyecam")
     (projectile-project-name . "ueyecam")
     (projectile-project-run-cmd . "./build/release/mqttClient")
     (projectile-project-name . "mqttClient")
     (cmake-ide-build-dir . "~/Projekte/ueye/measurecam/build/release")
     (cmake-ide-project-dir . "~/Projekte/ueye/measurecam")
     (projectile-project-run-cmd . "./build/release/measurecam")
     (projectile-project-name . "measurecam")
     (projectile-project-run-cmd . "./build/release/navcam")
     (projectile-project-name . "navcam")
     (cmake-ide-build-dir . "~/Projekte/ueye/vicon_bridge")
     (cmake-ide-project-dir . "~/Projekte/ueye/vicon_bridge")
     (cmake-ide-build-dir . "~/Projekte/loadrunner/trajectoryHandler/build/release")
     (cmake-ide-project-dir . "~/Projekte/loadrunner/trajectoryHandler")
     (helm-make-build-dir . "")
     (projectile-project-run-cmd . "./vicon_bridge")
     (projectile-project-name . "vicon_bridge")
     (projectile-project-run-cmd . "./build/sandbox")
     (projectile-project-name . "sandbox")
     (projectile-project-run-cmd . "./build/openvxTest")
     (projectile-project-name . "openvxTest")
     (helm-make-build-dir . "build/release")
     (projectile-project-run-cmd . "./build/release/trajectoryHandler")
     (projectile-project-name . "trajectoryHandler")
     (helm-make-arguments . "-j12")
     (helm-make-build-dir . "./build")
     (projectile-project-run-cmd . "./build/opencvTest")
     (projectile-project-name . "opencvTest")
     (cmake-ide-cmake-opts . "-DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -j12")
     (cmake-ide-build-dir . "~/Projekte/c++testbed/opencvTest/build")
     (cmake-ide-project-dir . "~/Projekte/c++testbed/opencvTest")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
