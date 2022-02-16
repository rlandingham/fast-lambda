FROM public.ecr.aws/lambda/python:3.9

COPY Pipfile .
COPY Pipfile.lock .
RUN pip install pipenv
RUN pipenv install --system --deploy

COPY . .

CMD [ "api.app.handler" ]