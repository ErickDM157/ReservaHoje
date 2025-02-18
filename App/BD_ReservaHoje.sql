SHOW CREATE TABLE acomodacao;
-- view acomodaçao

CREATE VIEW acomodacao_view AS
SELECT acom_id, acom_capacidade, acom_descricao, acom_preco_diaria, acom_numero
FROM acomodacao;


-- procedure acomodaçao

-- inserir
DELIMITER $$

CREATE PROCEDURE AddAcomodacao (
    IN capacidade INT,
    IN descricao TEXT,
    IN preco_diaria DECIMAL(10,2),
    IN numero INT,
    IN propriedade_id INT,
    IN avaliacao_id INT,
    IN comodidade_id INT,
    IN categoria_id INT
)
BEGIN
    INSERT INTO acomodacao (acom_capacidade, acom_descricao, acom_preco_diaria, acom_numero, prop_id, aval_id, como_id, cate_id)
    VALUES (capacidade, descricao, preco_diaria, numero, propriedade_id, avaliacao_id, comodidade_id, categoria_id);
END $$

DELIMITER ;

-- delete

DELIMITER $$

CREATE PROCEDURE DeleteAcomodacao (
    IN acomodacao_id INT
)
BEGIN
    DELETE FROM acomodacao
    WHERE acom_id = acomodacao_id;
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE PROCEDURE UpdateAcomodacao (
    IN acomodacao_id INT,
    IN capacidade INT,
    IN descricao TEXT,
    IN preco_diaria DECIMAL(10,2),
    IN numero INT
)
BEGIN
    UPDATE acomodacao
    SET acom_capacidade = capacidade, acom_descricao = descricao, acom_preco_diaria = preco_diaria, acom_numero = numero
    WHERE acom_id = acomodacao_id;
END $$

DELIMITER ;


-- trigger aomodaçao

-- inserir
DELIMITER $$

CREATE TRIGGER before_acomodacao_insert
BEFORE INSERT ON acomodacao
FOR EACH ROW
BEGIN
    IF NEW.acom_capacidade < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacidade não pode ser negativa';
    END IF;
END $$

DELIMITER ;


-- deletar
DELIMITER $$

CREATE TRIGGER after_acomodacao_delete
AFTER DELETE ON acomodacao
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, acom_id, acom_descricao, timestamp)
    VALUES ('DELETE', OLD.acom_id, OLD.acom_descricao, NOW());
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE TRIGGER before_acomodacao_update
BEFORE UPDATE ON acomodacao
FOR EACH ROW
BEGIN
    IF NEW.acom_capacidade < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacidade não pode ser negativa';
    END IF;
END $$

DELIMITER ;

AVALIAÇÃO
SHOW CREATE TABLE avaliacao;
-- view avaliacao

CREATE VIEW avaliacao_view AS
SELECT aval_id, aval_comentario, aval_estrelas
FROM avaliacao;


-- procedure avaliacao

-- inserir
DELIMITER $$

CREATE PROCEDURE AddAvaliacao (
    IN comentario TEXT,
    IN estrelas INT
)
BEGIN
    INSERT INTO avaliacao (aval_comentario, aval_estrelas)
    VALUES (comentario, estrelas);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteAvaliacao (
    IN avaliacao_id INT
)
BEGIN
    DELETE FROM avaliacao
    WHERE aval_id = avaliacao_id;
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE PROCEDURE UpdateAvaliacao (
    IN avaliacao_id INT,
    IN comentario TEXT,
    IN estrelas INT
)
BEGIN
    UPDATE avaliacao
    SET aval_comentario = comentario, aval_estrelas = estrelas
    WHERE aval_id = avaliacao_id;
END $$

DELIMITER ;

-- trigger avaliacao

-- inserir
DELIMITER $$

CREATE TRIGGER before_avaliacao_insert
BEFORE INSERT ON avaliacao
FOR EACH ROW
BEGIN
    IF NEW.aval_estrelas < 1 OR NEW.aval_estrelas > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de estrelas deve ser entre 1 e 5';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_avaliacao_delete
AFTER DELETE ON avaliacao
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, aval_id, aval_comentario, timestamp)
    VALUES ('DELETE', OLD.aval_id, OLD.aval_comentario, NOW());
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE TRIGGER before_avaliacao_update
BEFORE UPDATE ON avaliacao
FOR EACH ROW
BEGIN
    IF NEW.aval_estrelas < 1 OR NEW.aval_estrelas > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de estrelas deve ser entre 1 e 5';
    END IF;
END $$

DELIMITER ;

CATEGORIA
SHOW CREATE TABLE categoria;
-- view categoria
CREATE VIEW categoria_view AS
SELECT cate_id, cate_descricao
FROM categoria;

-- procedure categoria
-- inserir
DELIMITER $$

CREATE PROCEDURE AddCategoria (
    IN descricao VARCHAR(100)
)
BEGIN
    INSERT INTO categoria (cate_descricao)
    VALUES (descricao);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteCategoria (
    IN categoria_id INT
)
BEGIN
    DELETE FROM categoria
    WHERE cate_id = categoria_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateCategoria (
    IN categoria_id INT,
    IN descricao VARCHAR(100)
)
BEGIN
    UPDATE categoria
    SET cate_descricao = descricao
    WHERE cate_id = categoria_id;
END $$

DELIMITER ;

-- trigger categoria
-- inserir
DELIMITER $$

CREATE TRIGGER before_categoria_insert
BEFORE INSERT ON categoria
FOR EACH ROW
BEGIN
    IF NEW.cate_descricao = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A descrição não pode estar vazia';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_categoria_delete
AFTER DELETE ON categoria
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, cate_id, cate_descricao, timestamp)
    VALUES ('DELETE', OLD.cate_id, OLD.cate_descricao, NOW());
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE TRIGGER before_categoria_update
BEFORE UPDATE ON categoria
FOR EACH ROW
BEGIN
    IF NEW.cate_descricao = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A descrição não pode estar vazia';
    END IF;
END $$

DELIMITER ;

CLIENTE
select*from cliente;
select*from telefone;

SHOW CREATE TABLE cliente;
-- view cliente

CREATE VIEW cliente_view AS
SELECT clie_id, clie_nome, clie_email, clie_idade, clie_sexo
FROM cliente;


-- procedure cliente

-- inserir
DELIMITER $$

CREATE PROCEDURE AddCliente (
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN senha VARCHAR(100),
    IN idade INT,
    IN sexo CHAR(1),
    IN telefone_id INT
)
BEGIN
    INSERT INTO cliente (clie_nome, clie_email, clie_senha, clie_idade, clie_sexo, tele_id)
    VALUES (nome, email, senha, idade, sexo, telefone_id);
END $$

DELIMITER ;

-- deletar

DELIMITER $$

CREATE PROCEDURE DeleteCliente (
    IN cliente_id INT
)
BEGIN
    DELETE FROM cliente
    WHERE clie_id = cliente_id;
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE PROCEDURE UpdateCliente (
    IN cliente_id INT,
    IN nome VARCHAR(100),
    IN email VARCHAR(100)
)
BEGIN
    UPDATE cliente
    SET clie_nome = nome, clie_email = email
    WHERE clie_id = cliente_id;
END $$

DELIMITER ;



-- trigger cliente

-- inserir

DELIMITER $$

CREATE TRIGGER before_cliente_insert
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
    IF NEW.clie_idade < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Idade não pode ser negativa';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_cliente_delete
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, clie_id, clie_nome, timestamp)
    VALUES ('DELETE', OLD.clie_id, OLD.clie_nome, NOW());
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE TRIGGER before_cliente_update
BEFORE UPDATE ON cliente
FOR EACH ROW
BEGIN
    IF NEW.clie_idade < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Idade não pode ser negativa';
    END IF;
END $$

DELIMITER ;

COMODIDADE
SHOW CREATE TABLE comodidade;
-- view comodidade
CREATE VIEW comodidade_view AS
SELECT como_id, como_icon, como_descricao
FROM comodidade;

-- procedure comodidade
-- inserir
DELIMITER $$

CREATE PROCEDURE AddComodidade (
    IN icon VARCHAR(100),
    IN descricao VARCHAR(255)
)
BEGIN
    INSERT INTO comodidade (como_icon, como_descricao)
    VALUES (icon, descricao);
END $$

DELIMITER ;

-- deletar

DELIMITER $$

CREATE PROCEDURE DeleteComodidade (
    IN comodidade_id INT
)
BEGIN
    DELETE FROM comodidade
    WHERE como_id = comodidade_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateComodidade (
    IN comodidade_id INT,
    IN icon VARCHAR(100),
    IN descricao VARCHAR(255)
)
BEGIN
    UPDATE comodidade
    SET como_icon = icon, como_descricao = descricao
    WHERE como_id = comodidade_id;
END $$

DELIMITER ;

-- trigger comodidade
-- inserir

DELIMITER $$

CREATE TRIGGER before_comodidade_insert
BEFORE INSERT ON comodidade
FOR EACH ROW
BEGIN
    IF NEW.como_icon = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O ícone não pode estar vazio';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_comodidade_delete
AFTER DELETE ON comodidade
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, como_id, como_descricao, timestamp)
    VALUES ('DELETE', OLD.como_id, OLD.como_descricao, NOW());
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE TRIGGER before_comodidade_update
BEFORE UPDATE ON comodidade
FOR EACH ROW
BEGIN
    IF NEW.como_icon = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O ícone não pode estar vazio';
    END IF;
END $$

DELIMITER ;

ENDEREÇO
SHOW CREATE TABLE endereco;
-- view endereco
CREATE VIEW endereco_view AS
SELECT ende_cod, ende_rua, ende_bairro, ende_numero, loca_id
FROM endereco;

-- procedure endereco
-- inserir
DELIMITER $$

CREATE PROCEDURE AddEndereco (
    IN rua VARCHAR(100),
    IN bairro VARCHAR(50),
    IN numero INT,
    IN localidade_id INT
)
BEGIN
    INSERT INTO endereco (ende_rua, ende_bairro, ende_numero, loca_id)
    VALUES (rua, bairro, numero, localidade_id);
END $$

DELIMITER ;

-- deletar

DELIMITER $$

CREATE PROCEDURE DeleteEndereco (
    IN endereco_id INT
)
BEGIN
    DELETE FROM endereco
    WHERE ende_cod = endereco_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateEndereco (
    IN endereco_id INT,
    IN rua VARCHAR(100),
    IN bairro VARCHAR(50),
    IN numero INT
)
BEGIN
    UPDATE endereco
    SET ende_rua = rua, ende_bairro = bairro, ende_numero = numero
    WHERE ende_cod = endereco_id;
END $$

DELIMITER ;


-- trigger endereco
-- inserir
DELIMITER $$

CREATE TRIGGER before_endereco_insert
BEFORE INSERT ON endereco
FOR EACH ROW
BEGIN
    IF NEW.ende_numero < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número não pode ser negativo';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_endereco_delete
AFTER DELETE ON endereco
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, ende_cod, ende_rua, timestamp)
    VALUES ('DELETE', OLD.ende_cod, OLD.ende_rua, NOW());
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE TRIGGER before_endereco_update
BEFORE UPDATE ON endereco
FOR EACH ROW
BEGIN
    IF NEW.ende_numero < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número não pode ser negativo';
    END IF;
END $$

DELIMITER ;

FORMA DE PAGAMENTO
SHOW CREATE TABLE forma_pagamento;
-- view forma_pagamento
CREATE VIEW forma_pagamento_view AS
SELECT form_id, form_tipo, form_parcela
FROM forma_pagamento;

-- procedure forma_pagamento
-- inserir
DELIMITER $$

CREATE PROCEDURE AddFormaPagamento (
    IN tipo VARCHAR(50),
    IN parcela INT
)
BEGIN
    INSERT INTO forma_pagamento (form_tipo, form_parcela)
    VALUES (tipo, parcela);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteFormaPagamento (
    IN forma_id INT
)
BEGIN
    DELETE FROM forma_pagamento
    WHERE form_id = forma_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateFormaPagamento (
    IN forma_id INT,
    IN tipo VARCHAR(50),
    IN parcela INT
)
BEGIN
    UPDATE forma_pagamento
    SET form_tipo = tipo, form_parcela = parcela
    WHERE form_id = forma_id;
END $$

DELIMITER ;

-- trigger forma_pagamento
-- inserir
DELIMITER $$

CREATE TRIGGER before_forma_pagamento_insert
BEFORE INSERT ON forma_pagamento
FOR EACH ROW
BEGIN
    IF NEW.form_parcela < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A parcela não pode ser negativa';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_forma_pagamento_delete
AFTER DELETE ON forma_pagamento
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, form_id, form_tipo, timestamp)
    VALUES ('DELETE', OLD.form_id, OLD.form_tipo, NOW());
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE TRIGGER before_forma_pagamento_update
BEFORE UPDATE ON forma_pagamento
FOR EACH ROW
BEGIN
    IF NEW.form_parcela < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A parcela não pode ser negativa';
    END IF;
END $$

DELIMITER ;

LOCALIDADE
SHOW CREATE TABLE localidade;
-- view localidade

CREATE VIEW localidade_view AS
SELECT loca_id, loca_estado, loca_cidade, loca_pais
FROM localidade;

-- procedure localidade
-- inserir
DELIMITER $$

CREATE PROCEDURE AddLocalidade (
    IN estado VARCHAR(50),
    IN cidade VARCHAR(50),
    IN pais VARCHAR(50)
)
BEGIN
    INSERT INTO localidade (loca_estado, loca_cidade, loca_pais)
    VALUES (estado, cidade, pais);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteLocalidade (
    IN localidade_id INT
)
BEGIN
    DELETE FROM localidade
    WHERE loca_id = localidade_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateLocalidade (
    IN localidade_id INT,
    IN estado VARCHAR(50),
    IN cidade VARCHAR(50),
    IN pais VARCHAR(50)
)
BEGIN
    UPDATE localidade
    SET loca_estado = estado, loca_cidade = cidade, loca_pais = pais
    WHERE loca_id = localidade_id;
END $$

DELIMITER ;

-- trigger localidade
-- inserir
DELIMITER $$

CREATE TRIGGER before_localidade_insert
BEFORE INSERT ON localidade
FOR EACH ROW
BEGIN
    IF NEW.loca_estado = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O estado não pode estar vazio';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_localidade_delete
AFTER DELETE ON localidade
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, loca_id, loca_cidade, timestamp)
    VALUES ('DELETE', OLD.loca_id, OLD.loca_cidade, NOW());
END $$

DELIMITER ;

-- atualizar

DELIMITER $$

CREATE TRIGGER before_localidade_update
BEFORE UPDATE ON localidade
FOR EACH ROW
BEGIN
    IF NEW.loca_estado = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O estado não pode estar vazio';
    END IF;
END $$

DELIMITER ;

PROPRIEDADE
SHOW CREATE TABLE propriedade;
-- view propriedade
CREATE VIEW propriedade_view AS
SELECT prop_id, prop_nome, prop_descricao, prop_email, loca_id, tele_id
FROM propriedade;

-- procedure propriedade
-- inserir
DELIMITER $$

CREATE PROCEDURE AddPropriedade (
    IN nome VARCHAR(100),
    IN descricao TEXT,
    IN email VARCHAR(100),
    IN localidade_id INT,
    IN telefone_id INT
)
BEGIN
    INSERT INTO propriedade (prop_nome, prop_descricao, prop_email, loca_id, tele_id)
    VALUES (nome, descricao, email, localidade_id, telefone_id);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeletePropriedade (
    IN propriedade_id INT
)
BEGIN
    DELETE FROM propriedade
    WHERE prop_id = propriedade_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdatePropriedade (
    IN propriedade_id INT,
    IN nome VARCHAR(100),
    IN descricao TEXT,
    IN email VARCHAR(100),
    IN localidade_id INT,
    IN telefone_id INT
)
BEGIN
    UPDATE propriedade
    SET prop_nome = nome, prop_descricao = descricao, prop_email = email, loca_id = localidade_id, tele_id = telefone_id
    WHERE prop_id = propriedade_id;
END $$

DELIMITER ;

-- trigger propriedade
-- inserir
DELIMITER $$

CREATE TRIGGER before_propriedade_insert
BEFORE INSERT ON propriedade
FOR EACH ROW
BEGIN
    IF NEW.prop_nome = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O nome da propriedade não pode estar vazio';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_propriedade_delete
AFTER DELETE ON propriedade
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, prop_id, prop_nome, timestamp)
    VALUES ('DELETE', OLD.prop_id, OLD.prop_nome, NOW());
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE TRIGGER before_propriedade_update
BEFORE UPDATE ON propriedade
FOR EACH ROW
BEGIN
    IF NEW.prop_nome = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O nome da propriedade não pode estar vazio';
    END IF;
END $$

DELIMITER ;

RESERVA
SHOW CREATE TABLE reserva;
-- view reserva
CREATE VIEW reserva_view AS
SELECT rese_id, rese_num_criancas, rese_num_viajantes, rese_dth_inicio, rese_dth_fim, clie_id, acom_id, form_id, stat_id
FROM reserva;

-- procedure reserva
-- inserir
DELIMITER $$

CREATE PROCEDURE AddReserva (
    IN num_criancas INT,
    IN num_viajantes INT,
    IN dth_inicio DATETIME,
    IN dth_fim DATETIME,
    IN cliente_id INT,
    IN acomodacao_id INT,
    IN forma_id INT,
    IN status_id INT
)
BEGIN
    INSERT INTO reserva (rese_num_criancas, rese_num_viajantes, rese_dth_inicio, rese_dth_fim, clie_id, acom_id, form_id, stat_id)
    VALUES (num_criancas, num_viajantes, dth_inicio, dth_fim, cliente_id, acomodacao_id, forma_id, status_id);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteReserva (
    IN reserva_id INT
)
BEGIN
    DELETE FROM reserva
    WHERE rese_id = reserva_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateReserva (
    IN reserva_id INT,
    IN num_criancas INT,
    IN num_viajantes INT,
    IN dth_inicio DATETIME,
    IN dth_fim DATETIME
)
BEGIN
    UPDATE reserva
    SET rese_num_criancas = num_criancas, rese_num_viajantes = num_viajantes, rese_dth_inicio = dth_inicio, rese_dth_fim = dth_fim
    WHERE rese_id = reserva_id;
END $$

DELIMITER ;

-- trigger reserva
-- inserir
DELIMITER $$

CREATE TRIGGER before_reserva_insert
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
    IF NEW.rese_num_criancas < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de crianças não pode ser negativo';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_reserva_delete
AFTER DELETE ON reserva
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, rese_id, rese_num_viajantes, timestamp)
    VALUES ('DELETE', OLD.rese_id, OLD.rese_num_viajantes, NOW());
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE TRIGGER before_reserva_update
BEFORE UPDATE ON reserva
FOR EACH ROW
BEGIN
    IF NEW.rese_num_criancas < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de crianças não pode ser negativo';
    END IF;
END $$

DELIMITER ;

STATUS
SHOW CREATE TABLE status;
-- view status
CREATE VIEW status_view AS
SELECT stat_id, stat_situacao
FROM status;

-- procedure status
-- inserir
DELIMITER $$

CREATE PROCEDURE AddStatus (
    IN situacao VARCHAR(50)
)
BEGIN
    INSERT INTO status (stat_situacao)
    VALUES (situacao);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteStatus (
    IN status_id INT
)
BEGIN
    DELETE FROM status
    WHERE stat_id = status_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateStatus (
    IN status_id INT,
    IN situacao VARCHAR(50)
)
BEGIN
    UPDATE status
    SET stat_situacao = situacao
    WHERE stat_id = status_id;
END $$

DELIMITER ;

-- trigger status
-- inserir
DELIMITER $$

CREATE TRIGGER before_status_insert
BEFORE INSERT ON status
FOR EACH ROW
BEGIN
    IF NEW.stat_situacao = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A situação não pode estar vazia';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_status_delete
AFTER DELETE ON status
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, stat_id, stat_situacao, timestamp)
    VALUES ('DELETE', OLD.stat_id, OLD.stat_situacao, NOW());
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE TRIGGER before_status_update
BEFORE UPDATE ON status
FOR EACH ROW
BEGIN
    IF NEW.stat_situacao = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A situação não pode estar vazia';
    END IF;
END $$

DELIMITER ;

TELEFONE
SHOW CREATE TABLE telefone;
-- view telefone
CREATE VIEW telefone_view AS
SELECT tele_id, tele_numero
FROM telefone;

-- procedure telefone
-- inserir
DELIMITER $$

CREATE PROCEDURE AddTelefone (
    IN numero VARCHAR(15)
)
BEGIN
    INSERT INTO telefone (tele_numero)
    VALUES (numero);
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE PROCEDURE DeleteTelefone (
    IN telefone_id INT
)
BEGIN
    DELETE FROM telefone
    WHERE tele_id = telefone_id;
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE PROCEDURE UpdateTelefone (
    IN telefone_id INT,
    IN numero VARCHAR(15)
)
BEGIN
    UPDATE telefone
    SET tele_numero = numero
    WHERE tele_id = telefone_id;
END $$

DELIMITER ;

-- trigger telefone
-- inserir
DELIMITER $$

CREATE TRIGGER before_telefone_insert
BEFORE INSERT ON telefone
FOR EACH ROW
BEGIN
    IF NEW.tele_numero = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de telefone não pode estar vazio';
    END IF;
END $$

DELIMITER ;

-- deletar
DELIMITER $$

CREATE TRIGGER after_telefone_delete
AFTER DELETE ON telefone
FOR EACH ROW
BEGIN
    INSERT INTO log_table (action, tele_id, tele_numero, timestamp)
    VALUES ('DELETE', OLD.tele_id, OLD.tele_numero, NOW());
END $$

DELIMITER ;

-- atualizar
DELIMITER $$

CREATE TRIGGER before_telefone_update
BEFORE UPDATE ON telefone
FOR EACH ROW
BEGIN
    IF NEW.tele_numero = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de telefone não pode estar vazio';
    END IF;
END $$

DELIMITER ;
