# Django Docker Base

Base local simples para projetos Django com Postgres 18, Uvicorn, DRF, JWT, CORS, filters, extensions, media e static.

## Estrutura dos apps

Os apps do projeto ficam em:

```text
./DjangoServer/apps
```

Exemplo:

```text
./DjangoServer/apps/posts
```

## Subir o projeto

```bash
docker compose up -d --build
```

API:

```text
http://localhost:8000/api/health/
http://localhost:8000/api/posts/
```

Admin:

```text
http://localhost:8000/admin/
```

## Criar superusuario

```bash
docker compose exec web python manage.py createsuperuser
```

## Rodar comandos comuns

```bash
docker compose exec web python manage.py migrate
docker compose exec web python manage.py makemigrations
docker compose exec web python manage.py collectstatic --noinput
```

## Testes e qualidade

Documentação rápida:

```text
docs/API.md
docs/RUFF.md
docs/PRE_COMMIT.md
```

Rodar testes:

```bash
docker compose exec web pytest
```

Rodar Ruff:

```bash
docker compose exec web ruff check .
docker compose exec web ruff format .
```

Instalar pre-commit:

```bash
docker compose exec web pre-commit install
```

Depois disso, o Ruff roda automaticamente antes dos commits.

## Pastas locais

```text
./data/postgres  -> dados do Postgres
./data/media     -> uploads/media
```

Static normal do projeto:

```text
./DjangoServer/static
```

Static coletado:

```text
./DjangoServer/staticfiles
```
