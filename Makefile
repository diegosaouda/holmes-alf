setup:
	@pip install -r requirements.txt

clean:
	@find . -iname '*.pyc' -delete
	@rm -rf *.egg-info dist

test-deps:
	@pip install -U -e .\[tests\]

test: clean
	@coverage run --branch `which nosetests` -vv --with-yanc -s tests/
	@coverage report -m --fail-under=80

version:
	@bin/new-version.sh

upload_release: clean
	@read -r -p "PyPI index-server: " PYPI_SERVER; \
		python setup.py -q sdist upload -r "$$PYPI_SERVER"

release: version upload_release

