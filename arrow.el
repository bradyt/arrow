;;; arrow.el --- All my arrow related functions and bindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Brady Trainor

;; Author: Brady Trainor <mail@bradyt.com>
;; Version: 0.0.1
;; Keywords:convenience
;; Homepage: https://github.com/bradyt/arrow
;; Package-Requires: ((emacs "24"))


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; error: Package should have a non-empty ;;; Commentary section.

;;; Code:

(when (require 'evil nil t)
  (define-key evil-motion-state-map [left] nil)
  (define-key evil-motion-state-map [right] nil)
  (define-key evil-motion-state-map [up] nil)
  (define-key evil-motion-state-map [down] nil))

(defun arrow-window-increase-height ()
  "Increase window height."
  (interactive)
  (if (window-in-direction 'down)
      (enlarge-window 1)
    (shrink-window 1)))

(defun arrow-window-decrease-height ()
  "Decrease window height."
  (interactive)
  (if (window-in-direction 'down)
      (shrink-window 1)
    (enlarge-window 1)))

(defun arrow-window-increase-width ()
  "Increase window width."
  (interactive)
  (if (window-in-direction 'right)
      (enlarge-window-horizontally 4)
    (shrink-window-horizontally 4)))

(defun arrow-window-decrease-width ()
  "Decrease window width."
  (interactive)
  (if (window-in-direction 'right)
      (shrink-window-horizontally 4)
    (enlarge-window-horizontally 4)))

(defun arrow-scroll-right ()
  "Scroll right."
  (interactive)
  (scroll-right 1))

(defun arrow-scroll-left ()
  "Scroll left."
  (interactive)
  (scroll-left 1))

(define-minor-mode arrow nil
  :global t
  :require 'arrow
  :keymap `((,(kbd "<M-down>")      . arrow-window-increase-height)
            (,(kbd "<M-up>")        . arrow-window-decrease-height)
            (,(kbd "<M-right>")     . arrow-window-increase-width)
            (,(kbd "<M-left>")      . arrow-window-decrease-width)
            (,(kbd "<down>")        . windmove-down)
            (,(kbd "<up>")          . windmove-up)
            (,(kbd "<right>")       . windmove-right)
            (,(kbd "<left>")        . windmove-left)
            (,(kbd "<wheel-right>") . arrow-scroll-left)
            (,(kbd "<wheel-left>")  . arrow-scroll-right)))

(provide 'arrow)
;;; arrow.el ends here