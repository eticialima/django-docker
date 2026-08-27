# Ruff

Ruff é uma ferramenta para verificar e formatar código Python.

Ele substitui várias ferramentas comuns do ecossistema Python, como `flake8`, `isort` e parte do trabalho do `black`, mas com uma execução bem mais rápida.

Neste projeto ele é usado para:

- encontrar imports não usados;
- organizar imports;
- apontar erros simples de código;
- manter um estilo consistente;
- formatar os arquivos Python.

## Comandos

Verificar o código:

```bash
docker compose exec web ruff check .
```

Corrigir automaticamente o que for seguro:

```bash
docker compose exec web ruff check . --fix
```

Formatar o código:

```bash
docker compose exec web ruff format .
```

## Configuração

A configuração fica em:

```text
pyproject.toml
```

Hoje o projeto usa:

```toml
[tool.ruff]
line-length = 88
target-version = "py313"

[tool.ruff.lint]
select = ["E", "F", "I", "UP", "B"]
```

Resumo das regras:

- `E`: regras básicas de estilo;
- `F`: erros comuns, como variável/import não usado;
- `I`: organização de imports;
- `UP`: sugestões para Python moderno;
- `B`: possíveis bugs comuns.

## Quando usar

Use antes de subir mudanças ou quando quiser limpar o código:

```bash
docker compose exec web ruff check . --fix
docker compose exec web ruff format .
```
