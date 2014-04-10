.PHONY: clean-pyc clean-build docs

help:
	@echo "clean - remove all generated files"
	@echo "pdf - build all pdf"
	@echo "complete - build merged doc"

clean: 
	rm *.pdf

pdf: 
	rst2pdf job_beschreibung.rst
	rst2pdf job_description.rst

complete:
	rm README.rst
	cat *.rst > README.rst
	