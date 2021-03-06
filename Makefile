.PHONY: install
install:
	@python setup.py develop

.PHONY: pep8
pep8:
	@flake8 flasgger --ignore=F403

.PHONY: flasgger_package
flasgger_package:
	@cd etc/flasgger_package; python setup.py install

.PHONY: test
test: pep8 flasgger_package
	@py.test tests -s -vv --cov --cov-config=.coveragerc --doctest-modules flasgger

.PHONY: sdist
sdist: test
	@python setup.py sdist bdist_wheel upload

.PHONY: clean
clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
