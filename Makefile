.PHONY: clean-pyc clean-build docs

help:
	@echo "clean - remove all generated files"
	@echo "pdf - build all pdf"
	@echo "complete - build merged doc"

clean: 
	rm *.pdf

pdf: 
	cat inc/header.rst job_beschreibung.rst inc/footer.rst | rst2pdf > job_beschreibung.pdf
	cat inc/header.rst job_description.rst inc/footer.rst | rst2pdf > job_description.pdf
	cat inc/header.rst job_beschreibung_php.rst inc/footer.rst | rst2pdf > job_beschreibung_php.pdf
	cat inc/header.rst job_description_php.rst inc/footer.rst | rst2pdf > job_description_php.pdf
	cat inc/header.rst job_description_admin.rst inc/footer.rst | rst2pdf > job_description_admin.pdf
    
complete: pdf
	rm README.rst
	cat inc/header.rst  job_description.rst job_description_php.rst job_beschreibung.rst job_beschreibung_php.rst  inc/footer.rst > README.rst
	