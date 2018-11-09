SOURCES=src/ContravariantExample.hs src/KleisliExample.hs
TESTSOURCES=$(SOURCES) tests/hs-examples-tests.hs
SANDBOX=cabal.sandbox.config

all: dist

$(SANDBOX): hs-examples.cabal
	cabal update
	cabal sandbox init
	cabal install --only-dependencies --enable-tests  hs-examples.cabal

dist: $(SANDBOX) $(SOURCES) hs-examples.cabal
	cabal configure
	cabal build

tests:  dist $(TESTSOURCES)
	cabal configure --enable-tests
	cabal test

clean:
	cabal sandbox delete
	rm -rf dist
	find . -name "*~" -exec rm -rf {} \;

repl: all
	cabal repl

.PHONY: clean repl
