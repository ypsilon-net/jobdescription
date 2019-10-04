.PHONY: clean-pyc clean-build docs

HEAD_FOOT=inc/header.rst inc/footer.rst inc/allgemein.rst

complete: pdf html github readme

# HTML 
docs/%.html: %.rst $(HEAD_FOOT) 
	cat inc/header.rst $< inc/footer.rst | rst2html > $@
html: docs/job_beschreibung.html docs/job_beschreibung_admin.html docs/job_beschreibung_php.html docs/job_description.html docs/job_description_admin.html docs/job_description_php.html

# PDF
docs/%.pdf: %.rst $(HEAD_FOOT) 
	cat inc/header.rst $< inc/footer.rst | rst2pdf > $@
pdf: docs/job_beschreibung.pdf docs/job_beschreibung_admin.pdf docs/job_beschreibung_php.pdf docs/job_description.pdf docs/job_description_admin.pdf docs/job_description_php.pdf

# rst to rst for includes in github
docs/gh_%.rst: %.rst 
	pandoc $< -o $@
github: docs/gh_job_beschreibung.rst docs/gh_job_beschreibung_php.rst docs/gh_job_beschreibung_admin.rst

README.rst: job_description.rst job_description_php.rst job_description_admin.rst docs/gh_job_beschreibung.rst docs/gh_job_beschreibung_php.rst docs/gh_job_beschreibung_admin.rst
	cat job_description.rst \
		empty_line \
		job_description_php.rst \
		empty_line \
		job_description_admin.rst \
		empty_line \
		docs/gh_job_beschreibung.rst \
		empty_line \
		docs/gh_job_beschreibung_php.rst \
		empty_line \
		docs/gh_job_beschreibung_admin.rst > README.rst

help:
	@echo "clean - remove all generated files"
	@echo "pdf - build all pdf"
	@echo "complete - build merged doc"

clean: 
	rm docs/job*.pdf
	rm docs/job*.html

readme: README.rst
