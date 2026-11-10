CREATE TABLE perfil_faccao (
    usuario_id UUID PRIMARY KEY REFERENCES usuario(id) ON DELETE CASCADE,
    nome_fantasia VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    cidade VARCHAR(100),
    estado CHAR(2),
    capacidade_mensal INTEGER CHECK (capacidade_mensal >= 0),
    descricao TEXT
);

CREATE TABLE perfil_confeccao (
    usuario_id UUID PRIMARY KEY REFERENCES usuario(id) ON DELETE CASCADE,
    nome_fantasia VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE faccao_servico (
    faccao_id UUID NOT NULL REFERENCES perfil_faccao(usuario_id) ON DELETE CASCADE,
    servico_id UUID NOT NULL REFERENCES servico(id),
    PRIMARY KEY (faccao_id, servico_id)
);

CREATE TABLE demanda (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    confeccao_id UUID NOT NULL REFERENCES perfil_confeccao(usuario_id),
    servico_id UUID NOT NULL REFERENCES servico(id),
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    prazo_desejado DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'ABERTA'
        CHECK (status IN ('ABERTA','EM_NEGOCIACAO','ACORDADA','CONCLUIDA','CANCELADA')),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE proposta (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    demanda_id UUID NOT NULL REFERENCES demanda(id) ON DELETE CASCADE,
    faccao_id UUID NOT NULL REFERENCES perfil_faccao(usuario_id),
    valor NUMERIC(12,2) NOT NULL CHECK (valor >= 0),
    prazo_dias INTEGER NOT NULL CHECK (prazo_dias > 0),
    mensagem TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE'
        CHECK (status IN ('PENDENTE','ACEITA','RECUSADA')),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (id, demanda_id)
);

CREATE TABLE acordo (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    demanda_id UUID NOT NULL UNIQUE,
    proposta_id UUID NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'EM_EXECUCAO'
        CHECK (status IN ('EM_EXECUCAO','ENTREGUE','FINALIZADO')),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now(),
    FOREIGN KEY (proposta_id, demanda_id) REFERENCES proposta(id, demanda_id)
);

CREATE TABLE avaliacao (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    acordo_id UUID NOT NULL REFERENCES acordo(id),
    autor_id UUID NOT NULL REFERENCES usuario(id),
    destinatario_id UUID NOT NULL REFERENCES usuario(id),
    nota SMALLINT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now(),
    CHECK (autor_id <> destinatario_id)
);

CREATE TABLE categoria (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    confeccao_id UUID NOT NULL REFERENCES perfil_confeccao(usuario_id),
    categoria_id UUID REFERENCES categoria(id),
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco NUMERIC(12,2) NOT NULL CHECK (preco >= 0),
    ativo BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE variacao_produto (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    produto_id UUID NOT NULL REFERENCES produto(id) ON DELETE CASCADE,
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    sku VARCHAR(50) UNIQUE
);

CREATE TABLE endereco (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    logradouro VARCHAR(200) NOT NULL,
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL
);

CREATE TABLE pedido (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    comprador_id UUID NOT NULL REFERENCES usuario(id),
    endereco_id UUID REFERENCES endereco(id),
    endereco_snapshot TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE'
        CHECK (status IN ('PENDENTE','PAGO','EM_SEPARACAO','ENVIADO','ENTREGUE','CANCELADO')),
    total NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (total >= 0),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE item_pedido (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pedido_id UUID NOT NULL REFERENCES pedido(id) ON DELETE CASCADE,
    variacao_produto_id UUID NOT NULL REFERENCES variacao_produto(id),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(12,2) NOT NULL CHECK (preco_unitario >= 0),
    UNIQUE (pedido_id, variacao_produto_id)
);

CREATE TABLE pagamento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pedido_id UUID NOT NULL REFERENCES pedido(id),
    forma VARCHAR(20) NOT NULL
        CHECK (forma IN ('PIX','CARTAO_CREDITO','CARTAO_DEBITO','BOLETO')),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE'
        CHECK (status IN ('PENDENTE','APROVADO','RECUSADO','ESTORNADO')),
    valor NUMERIC(12,2) NOT NULL CHECK (valor >= 0),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE entrega (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pedido_id UUID NOT NULL REFERENCES pedido(id),
    codigo_rastreio VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'PREPARANDO'
        CHECK (status IN ('PREPARANDO','ENVIADA','ENTREGUE','DEVOLVIDA')),
    atualizado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE armazem (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE estoque (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    armazem_id UUID NOT NULL REFERENCES armazem(id),
    variacao_produto_id UUID NOT NULL REFERENCES variacao_produto(id),
    quantidade_atual INTEGER NOT NULL DEFAULT 0 CHECK (quantidade_atual >= 0),
    quantidade_reservada INTEGER NOT NULL DEFAULT 0 CHECK (quantidade_reservada >= 0),
    UNIQUE (armazem_id, variacao_produto_id),
    CHECK (quantidade_reservada <= quantidade_atual)
);

CREATE TABLE movimentacao_estoque (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    estoque_id UUID NOT NULL REFERENCES estoque(id),
    tipo VARCHAR(25) NOT NULL
        CHECK (tipo IN ('ENTRADA','SAIDA','AJUSTE','RESERVA','LIBERACAO_RESERVA')),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_demanda_status ON demanda(status);
CREATE INDEX idx_demanda_confeccao ON demanda(confeccao_id);
CREATE INDEX idx_proposta_demanda ON proposta(demanda_id);
CREATE INDEX idx_proposta_faccao ON proposta(faccao_id);
CREATE INDEX idx_produto_confeccao ON produto(confeccao_id);
CREATE INDEX idx_pedido_comprador ON pedido(comprador_id);
CREATE INDEX idx_pagamento_pedido ON pagamento(pedido_id);
CREATE INDEX idx_entrega_pedido ON entrega(pedido_id);
CREATE INDEX idx_mov_estoque ON movimentacao_estoque(estoque_id);
CREATE INDEX idx_avaliacao_dest ON avaliacao(destinatario_id);