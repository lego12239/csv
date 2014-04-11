.PHONY: build test clean doc

build:
	rebar compile

test: build
	cd test && \
	erlc -I ../.. test.erl && \
	echo '\n\n' && \
	erl -noinput -pa ../ebin -s test -s init stop

clean:
	find . -name '*~' -exec rm -f '{}' \+
	rm -f test/test.beam
	rebar clean

doc:
	rebar doc
