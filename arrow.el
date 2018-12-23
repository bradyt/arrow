;;; arrow.el --- All my arrow related functions and bindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Brady Trainor

;; Author: Brady Trainor <mail@bradyt.com>
;; Keywords:convenience

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

;;

;;; Code:

(defun my-window-increase-height ()
  (interactive)
  (if (window-in-direction 'down)
      (enlarge-window 1)
    (shrink-window 1)))

(defun my-window-decrease-height ()
  (interactive)
  (if (window-in-direction 'down)
      (shrink-window 1)
    (enlarge-window 1)))

(defun my-window-increase-width ()
  (interactive)
  (if (window-in-direction 'right)
      (enlarge-window-horizontally 4)
    (shrink-window-horizontally 4)))

(defun my-window-decrease-width ()
  (interactive)
  (if (window-in-direction 'right)
      (shrink-window-horizontally 4)
    (enlarge-window-horizontally 4)))

(defun my-scroll-right ()
  (interactive)
  (scroll-right 1))

(defun my-scroll-left ()
  (interactive)
  (scroll-left 1))

(define-minor-mode arrow nil
  :keymap `((,(kbd "<M-down>") . my-window-increase-height)
            (,(kbd "<M-up>") . my-window-decrease-height)
            (,(kbd "<M-right>") . my-window-increase-width)
            (,(kbd "<M-left>") . my-window-decrease-width)
            (,(kbd "<wheel-right>") . my-scroll-right)
            (,(kbd "<wheel-left>") . my-scroll-left)))

(provide 'arrow)
;;; arrow.el ends here

