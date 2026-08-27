# Pre-Commit

Pre-commit é uma ferramenta que roda verificações automaticamente antes de cada commit do Git.

A ideia é simples: antes do commit ser criado, ele executa ferramentas como o Ruff para evitar que código com erro simples, import bagunçado ou formatação fora do padrão entre no projeto.

Neste projeto, o pre-commit roda:

- `ruff check --fix`;
- `ruff format`.

## Configuração

A configuração fica em:

```text
.pre-commit-config.yaml
```

Ela aponta quais hooks serão executados antes do commit.

## Instalação

Depois que o projeto estiver rodando, instale o hook:

```bash
docker compose exec web pre-commit install
```

Esse comando configura o Git local para chamar o pre-commit automaticamente.

## Uso automático

Depois de instalado, basta commitar normalmente:

```bash
git add .
git commit -m "minha mensagem"
```

Antes de concluir o commit, o pre-commit vai rodar as verificações.

Se ele corrigir algum arquivo automaticamente, o commit pode parar. Nesse caso, veja o que mudou, adicione de novo e rode o commit outra vez:

```bash
git add .
git commit -m "minha mensagem"
```

## Rodar manualmente

Também dá para rodar em todos os arquivos manualmente:

```bash
docker compose exec web pre-commit run --all-files
```

## Quando usar

Use o pre-commit quando quiser garantir uma checagem automática antes dos commits.

Se estiver só estudando ou testando algo rápido, dá para usar apenas:

```bash
docker compose exec web ruff check . --fix
docker compose exec web ruff format .
```
