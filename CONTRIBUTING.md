# CONTRIBUTING.md

# Guia de Contribuição — PI-LogicFLow

Este documento estabelece os padrões de desenvolvimento, organização e colaboração utilizados no projeto.

## 1. Padrão de branches

As branches de funcionalidades devem seguir o padrão:

`feature/<id-issue>-<descricao>`

Exemplos:

- `feature/1-login-usuario`
- `feature/2-modelagem-banco`
- `feature/3-tela-inicial`
- `feature/4-integracao-api`

Regras:

- Toda funcionalidade deve ser desenvolvida em uma branch própria.
- As branches de funcionalidades devem partir da `develop`.
- As alterações devem ser integradas à `develop` por Pull Request.
- A branch `main` deve permanecer protegida contra pushes diretos.

## 2. Padrão de commits

O projeto utiliza Conventional Commits.

Formato:

`tipo: descrição da alteração`

Tipos utilizados:

- `feat:` Adição de novas funcionalidades.
- `fix:` Correção de erros.
- `docs:` Alterações na documentação.
- `chore:` Configurações e manutenção.
- `test:` Criação ou alteração de testes.

Exemplos:

- `feat: add user registration`
- `fix: correct login validation`
- `docs: update README`
- `chore: configure project dependencies`
- `test: add authentication tests`

Os commits devem ser atômicos, representando alterações pequenas e específicas.

## 3. Pull Requests e Issues

Toda funcionalidade deverá ser integrada à `develop` por meio de Pull Request.

Regras:

- Não realizar alterações diretamente na `main`.
- Utilizar títulos e descrições claros nos Pull Requests.
- Vincular obrigatoriamente o ID da Issue relacionada.
- Realizar revisão antes da integração.

Para vincular uma Issue, utilizar no corpo do Pull Request:

`closes #1`

O número deve corresponder à Issue relacionada.

## 4. Versionamento

O projeto utiliza Semantic Versioning (SemVer 2.0.0).

Formato:

`MAJOR.MINOR.PATCH`

Exemplo da versão inicial:

`v0.1.0-alpha`

- MAJOR: mudanças incompatíveis.
- MINOR: adição de funcionalidades.
- PATCH: correções de erros.

O projeto poderá utilizar identificadores de pré-lançamento, como `alpha` e `beta`.