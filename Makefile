install:
	pip install --upgrade pip && pip install -r requirements/requirements.txt && pip install -r requirements/test_requirements.txt

train_pipeline:
	python bikeshare_model/train_pipeline.py

format:
	black . *.py

lint:
	pylint --disable=R,C bikeshare_model/ bikeshare_model_api/app/

mypy:
	mypy --implicit-optional bikeshare_model/ bikeshare_model_api/ tests/

test:
	python -m pytest

all: install format lint mypy train_pipeline test