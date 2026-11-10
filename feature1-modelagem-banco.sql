CREATE TABLE usuario (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(20) NOT NULL CHECK (perfil IN ('CONFECCAO', 'FACCAO', 'ADMIN')),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE servico (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO servico (nome) VALUES
    ('Costura'), ('Corte'), ('Bordado'), ('Estamparia'), ('Acabamento');