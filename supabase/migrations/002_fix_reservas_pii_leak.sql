-- A policy "pub_read" antiga expunha TODAS as colunas de reservas
-- (nome, email, whatsapp, observações) para qualquer visitante,
-- via chave anon. Corrige removendo o acesso público direto à
-- tabela e expondo só os campos necessários para o calendário
-- (disponibilidade de datas) através de uma view.

DROP POLICY IF EXISTS "pub_read" ON reservas;

CREATE VIEW reservas_datas AS
  SELECT id, data, titulo FROM reservas;

GRANT SELECT ON reservas_datas TO anon, authenticated;
