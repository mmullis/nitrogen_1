all: compile test

compile:
	mkdir -p ebin
	mkdir -p test/ebin
	erl -make

clean:
	rm -rf ./coverage/*.*
	rm -rf ./ebin/*.*
	rm -rf ./test/ebin/*.*

test: compile
	erl -noshell \
		-pa ebin \
		-pa test/ebin \
                -pa test/apps \
		-s test_suite test \
		-s init stop

coverage: compile
	git submodule init lib/coverize
	git submodule update lib/coverize
	make -C lib/coverize
	mkdir -p coverage
	erl -noshell \
		-pa ebin \
		-pa test/ebin \
		-pa test/apps \
		-pa lib/coverize/ebin \
		-s eunit_helper run_cover \
		-s init stop

console: compile
	erl -pa ebin \
		-pa test/ebin \
                -pa test/apps

#EXPERIMENTAL - Bug in erl_tidy trashes -spec
tidy: 
	erl -noshell \
		-s erl_tidy dir "./src" \
		-s erl_tidy dir "./test/src" \
		-s init stop
	find ./ -name \*.bak -exec rm {} \;



