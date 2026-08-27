# API

Documentação simples dos endpoints disponíveis nesta base.

URL local padrão:

```text
http://localhost:8000
```

## Health Check

Verifica se a API está respondendo.

```http
GET /api/health/
```

Resposta:

```json
{
  "status": "ok"
}
```

## JWT

Autenticação usando access token e refresh token.

### Gerar token

```http
POST /api/auth/token/
```

Body:

```json
{
  "username": "admin",
  "password": "admin"
}
```

Resposta:

```json
{
  "refresh": "refresh_token",
  "access": "access_token"
}
```

### Renovar token

```http
POST /api/auth/token/refresh/
```

Body:

```json
{
  "refresh": "refresh_token"
}
```

Resposta:

```json
{
  "access": "new_access_token"
}
```

### Usar token

Enviar o access token no header:

```http
Authorization: Bearer access_token
```

## Posts

CRUD simples de posts.

Campos:

```json
{
  "id": 1,
  "title": "Meu post",
  "description": "Descrição do post",
  "is_active": true,
  "metadata": {},
  "created_at": "2026-08-27T09:00:00-03:00",
  "updated_at": "2026-08-27T09:00:00-03:00"
}
```

### Listar posts

```http
GET /api/posts/
```

Filtros:

```http
GET /api/posts/?is_active=true
GET /api/posts/?search=django
GET /api/posts/?ordering=title
GET /api/posts/?ordering=-created_at
```

### Criar post

Precisa de autenticação.

```http
POST /api/posts/
Authorization: Bearer access_token
```

Body:

```json
{
  "title": "Meu post",
  "description": "Descrição do post",
  "is_active": true,
  "metadata": {
    "source": "local"
  }
}
```

### Detalhar post

```http
GET /api/posts/1/
```

### Atualizar post

Precisa de autenticação.

```http
PUT /api/posts/1/
Authorization: Bearer access_token
```

Body:

```json
{
  "title": "Post atualizado",
  "description": "Nova descrição",
  "is_active": true,
  "metadata": {}
}
```

### Atualizar parcialmente

Precisa de autenticação.

```http
PATCH /api/posts/1/
Authorization: Bearer access_token
```

Body:

```json
{
  "is_active": false
}
```

### Remover post

Precisa de autenticação.

```http
DELETE /api/posts/1/
Authorization: Bearer access_token
```
