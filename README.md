# 🧵 Logicflow — Plataforma Digital de Capacidade Ociosa para Facções e Confecções do Agreste

> Plataforma web (PWA) que conecta **confecções que precisam de serviços de produção** a **facções com capacidade disponível** no Polo de Confecções do Agreste Pernambucano.

![Status](https://img.shields.io/badge/status-em%20concepção-yellow)
![Projeto](https://img.shields.io/badge/projeto-acad%C3%AAmico-blue)
![Curso](https://img.shields.io/badge/SENAC-ADS-orange)

---

## 📌 Sobre o projeto

O Polo de Confecções do Agreste de Pernambuco reúne confecções, facções, lavanderias e profissionais autônomos. Muitas confecções terceirizam etapas como **costura, corte, bordado, estamparia e acabamento**, mas a busca por prestadores costuma depender de indicações, contatos pessoais e grupos de mensagens.

Como consequência:

- confecções têm dificuldade de encontrar quem atenda determinado prazo;
- facções ficam com **capacidade produtiva ociosa** por não saberem onde há demanda;
- não existe histórico estruturado para comparar preço, prazo e qualidade.

O **Logicflow** propõe uma solução simples e acessível pelo celular: a confecção publica o serviço de que precisa, as facções interessadas enviam propostas, as partes registram o acordo e, ao final, avaliam a experiência — construindo **reputação a partir do histórico real de entregas**.

Este projeto é um **Projeto Integrador (PI)** do curso de **Análise e Desenvolvimento de Sistemas do SENAC**, desenvolvido na disciplina de **Engenharia de Requisitos**.

## 🎯 Objetivos

**Objetivo geral:** desenvolver uma plataforma digital que conecte confecções e facções do Agreste, permitindo a publicação de demandas, o envio de propostas, o registro de acordos e a avaliação dos prestadores.

**Objetivos específicos:**

- Cadastro de confecções e facções com perfis distintos
- Cadastro de serviços e capacidade disponível das facções
- Publicação de demandas com quantidade, prazo e local
- Busca e filtros de demandas e facções
- Envio e comparação de propostas
- Registro do acordo entre as partes
- Notificações de novas demandas, propostas e prazos
- Avaliação mútua e reputação das facções
- Moderação contra perfis falsos e abusos
- Interface simples, pensada para o celular
- Proteção de dados pessoais conforme a **LGPD**

## ✨ Funcionalidades

### Cadastro e perfis
- Login por número de telefone com código de verificação
- Perfil de **confecção** e perfil de **facção** (serviços, capacidade, cidade e fotos)

### Demandas e propostas
- Publicação, edição, pausa e encerramento de demandas
- Busca e filtros por serviço, cidade, quantidade e prazo
- Envio de propostas com preço e prazo
- Comparação e aceite de propostas
- Registro do acordo e canal de contato (ex.: link para WhatsApp)

### Capacidade e agenda
- Capacidade produtiva semanal
- Períodos livres e ocupados
- Sinalização de facções disponíveis

### Confiança e acompanhamento
- Avaliação mútua ao final do serviço
- Média de avaliações e taxa de entregas no prazo
- Denúncia e moderação de perfis, demandas e avaliações
- Notificações de novas demandas, propostas, aceites e prazos
- Painel do administrador com indicadores de uso

### Exemplo de demanda

| Campo | Valor |
|---|---|
| **Demanda** | DM-2026-001 |
| **Serviço** | Costura reta — Camisa Polo |
| **Quantidade** | 500 peças |
| **Prazo** | 15 dias |
| **Local** | Toritama — PE |
| **Status** | Recebendo propostas |

## 🔄 Fluxo principal

```
Cadastro dos usuários (confecção e facção)
        ↓
Facção informa serviços e capacidade
        ↓
Confecção publica a demanda
        ↓
Facções compatíveis são notificadas
        ↓
Facções enviam propostas
        ↓
Confecção compara e aceita uma proposta
        ↓
Acordo registrado entre as partes
        ↓
Execução do serviço
        ↓
Conclusão registrada
        ↓
Avaliação mútua
```

## 👥 Atores

| Ator | Responsabilidades |
|---|---|
| **Confecção contratante** | Publicar demandas, receber e comparar propostas, aceitar proposta, avaliar a facção |
| **Facção / prestador** | Cadastrar serviços e capacidade, buscar demandas, enviar propostas, registrar conclusão e avaliar a confecção |
| **Administrador** | Analisar denúncias, verificar e suspender perfis, acompanhar indicadores, manter categorias de serviço |

## 🛠️ Tecnologias

> As tecnologias abaixo constituem uma **proposta de stack**, sujeita à validação e aos ajustes da equipe.

| Camada | Tecnologia | Uso |
|---|---|---|
| Front-end | **HTML5**, **CSS3**, **JavaScript** | Estrutura, estilo e interatividade |
| Front-end | **React.js** | Interface e componentes |
| Front-end | **Tailwind CSS** | Interfaces modernas e responsivas |
| Front-end | **PWA** | Instalação no celular via navegador |
| Back-end | **Node.js** + **Express.js** | API e gerenciamento de requisições |
| Banco de dados | **PostgreSQL** | Usuários, demandas, propostas e acordos |
| Serviços | **Supabase** | Autenticação e armazenamento de arquivos |
| Design | **Figma** | Prototipação e UX/UI |
| Versionamento | **Git** e **GitHub** | Código e colaboração |
| Hospedagem | **Vercel** | Publicação do front-end |

## 📋 Requisitos

### Funcionais (resumo)

| Código | Requisito |
|---|---|
| RF01 | Cadastro e login por telefone com código de verificação |
| RF02 | Escolha do perfil (confecção ou facção) no cadastro |
| RF03 | Cadastro dos serviços oferecidos pela facção |
| RF04 | Informar capacidade semanal e períodos disponíveis |
| RF05 | Anexar fotos ao perfil da facção e às demandas |
| RF06 | Publicar demandas de serviço |
| RF07 | Editar, pausar e encerrar demanda |
| RF08 | Buscar e filtrar demandas (serviço, cidade, quantidade, prazo) |
| RF09 | Buscar e filtrar facções (serviço, cidade, disponibilidade) |
| RF10 | Enviar proposta com preço e prazo |
| RF11 | Comparar propostas recebidas |
| RF12 | Aceitar uma proposta |
| RF13 | Registrar o acordo com condições confirmadas pelas duas partes |
| RF14 | Canal de contato entre as partes (ex.: WhatsApp) |
| RF15 | Notificações de demandas, propostas, aceites e prazos |
| RF16 | Registrar a conclusão do serviço |
| RF17 | Avaliação mútua após a conclusão |
| RF18 | Exibir média de avaliações e taxa de entregas no prazo |
| RF19 | Denunciar perfis, demandas e avaliações |
| RF20 | Administrador analisa denúncias e suspende perfis |
| RF21 | Informações gerais de uso para o administrador |

### Não funcionais

| Código | Requisito |
|---|---|
| RNF01 | Interface simples, com ações principais em poucos toques |
| RNF02 | Responsivo para smartphones, tablets e computadores |
| RNF03 | Instalável na tela inicial do celular (PWA) |
| RNF04 | Proteção de dados pessoais e conformidade com a LGPD |
| RNF05 | Exibir a outros usuários apenas os dados de contato necessários |
| RNF06 | Controle de acesso por perfil de usuário |
| RNF07 | Tempo de resposta adequado em conexões móveis comuns |
| RNF08 | Armazenamento organizado e consistente das informações |
| RNF09 | Facilidade de manutenção e evolução futura |

## 🚧 Escopo

**Fora do escopo da primeira versão:**

- Intermediação de pagamentos
- Contratos com validade jurídica
- Emissão de notas fiscais
- Logística e frete dos lotes
- Aplicativo nativo (Android/iOS)
- Recomendação automática por inteligência artificial
- Integração completa com rastreamento de lotes por QR Code
- Integração com sistemas governamentais

Essas funcionalidades poderão ser consideradas em versões futuras.

## 🗓️ Cronograma

| Etapa | Período | Situação |
|---|---|---|
| Identificação do problema e proposta | Outubro/2026 | ✅ Concluído |
| Pesquisa de soluções semelhantes | Outubro/2026 | 🔄 Em andamento |
| Levantamento de requisitos com usuários | Outubro/2026 | 🔄 Em andamento |
| Modelagem do sistema | Outubro/2026 | ⏳ Próxima etapa |
| Prototipação das telas | Outubro/Novembro/2026 | ⏳ Próxima etapa |
| Desenvolvimento | Novembro/2026 | ⏳ Próxima etapa |
| Testes e ajustes | Novembro/Dezembro/2026 | ⏳ Futuro |
| Apresentação final | Dezembro/2026 | ⏳ Futuro |

*As datas são estimativas e podem ser ajustadas conforme o calendário da disciplina.*

## 📈 Status atual

O projeto está na fase de **concepção da proposta e estruturação inicial dos requisitos**. Os requisitos ainda **não foram validados com usuários reais**; a validação por meio de conversas com confecções e facções do polo é uma das próximas etapas.

## 🚀 Como executar

> ⚠️ O código ainda está em fase de planejamento. Esta seção será atualizada conforme o desenvolvimento avançar.

```bash
# Clonar o repositório
git clone https://github.com/<seu-usuario>/logicflow.git
cd logicflow

# Instalar dependências (a definir)
npm install

# Executar em modo de desenvolvimento (a definir)
npm run dev
```

### Variáveis de ambiente (previsão)

```env
SUPABASE_URL=
SUPABASE_ANON_KEY=
DATABASE_URL=
```

## 📁 Estrutura sugerida

```
logicflow/
├── client/        # Front-end (React + Tailwind + PWA)
├── server/        # API (Node.js + Express)
├── docs/          # Documentação, requisitos e modelagem
└── README.md
```

## 👨‍💻 Equipe Logicflow

| Integrante | Responsabilidade |
|---|---|
| Marcelo Aguiar | Levantamento e documentação dos requisitos |
| Samuel Santos | Modelagem do banco de dados |
| Vinícius Bonifácio Ferreira | Prototipação e UX/UI |
| Cauã Dias | Desenvolvimento do sistema |
| Raul Roque | Testes e documentação |
| Ricardo Medeiros | Pesquisa com usuários e validação dos requisitos |
| Lucas Assis | Pesquisa de soluções semelhantes e apoio ao desenvolvimento |

Os integrantes se ajudam e revisam as atividades uns dos outros, mantendo o caráter colaborativo do projeto.

## 🎓 Contexto acadêmico

- **Instituição:** SENAC
- **Curso:** Análise e Desenvolvimento de Sistemas
- **Disciplina:** Engenharia de Requisitos
- **Tipo:** Projeto Integrador — Atividade III

## 🔭 Futuro

Em versões futuras, a plataforma poderá ser integrada a um sistema de **rastreamento de lotes por QR Code**, ligando a contratação ao acompanhamento da produção.

## 📚 Referências

- SILVA, Tacianne Mirelly Soares da. *Os sistemas de planejamento e controle da produção nas empresas de confecções do Polo de Confecções do Agreste Pernambucano*. TCC, UFPE, Caruaru, 2018.
- B2B Stack. *ERP têxtil e confecção: seleção de softwares*.
- CIGAM. *ERP para confecção: controle de estoque, produção e vendas*.

## 📄 Licença

Projeto acadêmico sem fins comerciais. Defina a licença do repositório (por exemplo, MIT) antes da publicação.
