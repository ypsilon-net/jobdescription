.PHONY: clean-pyc clean-build docs

help:
	@echo "clean - remove all generated files"
	@echo "pdf - build all pdf"
	@echo "complete - build merged doc"

clean: 
	rm *.pdf

pdf: 
	cat header.rst job_beschreibung.rst footer.rst | rst2pdf > job_beschreibung.pdf
	cat header.rst job_description.rst footer.rst | rst2pdf > job_description.pdf
	cat header.rst job_beschreibung_php.rst footer.rst | rst2pdf > job_beschreibung_php.pdf
	cat header.rst job_description_php.rst footer.rst | rst2pdf > job_description_php.pdf

complete:
	rm README.rst
	cat header.rst  job_description.rst job_description_php.rst job_beschreibung.rst job_beschreibung_php.rst  footer.rst > README.rst
	