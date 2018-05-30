(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するフォルダ
;; 2つ以上指定する場合の形 -> (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "elisp")


;;; スタートアップ非表示
(setq inhibit-startup-screen t)

;;; ツールバー非表示

;;; ファイルのフルパスをタイトルバーに表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))


;;; バックアップを残さない
(setq make-backup-files nil)

;;; 行番号表示
(global-linum-mode)

;;; 文字コード
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq file-name-coding-system 'sjis)
(setq locale-coding-system 'utf-8)

;;; 括弧の範囲内を強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#800")

;;; 選択領域の色
(set-face-background 'region "#555")

;;; 最近使ったファイルをメニューに表示
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)
;;; redo+.el
;; kbd -> C-.
;; http://www.emacswiki.org/emacs/download/redo+.el
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-.") 'redo))

;;;カーソル位置記憶
(save-place-mode 1)
