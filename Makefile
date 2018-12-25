all: install byte-compile clean-elc lint

install:
	cask install

byte-compile:
	cask emacs -batch \
		--eval "(setq byte-compile-error-on-warn t)" \
		-f batch-byte-compile \
		arrow.el

clean-elc:
	cask clean-elc

lint:
	cask emacs -batch \
		-f package-initialize \
		-l package-lint \
		--eval "(setq byte-compile-error-on-warn t)" \
		-f package-lint-batch-and-exit \
		arrow.el
