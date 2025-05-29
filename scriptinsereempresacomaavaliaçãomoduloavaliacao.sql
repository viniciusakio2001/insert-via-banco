
INSERT INTO avlcontexecucaoetapaavaliador (
  cod_avlcontexecucaoetapaavaliador_serial,
  cod_avaliacaocontratoexecucao_serial,
  cod_avaliacaocontratoetapa_serial,
  cod_usuario_serial,
  datainicio,
  datafinalizacaoprevisao,
  datafinalizacao,
  situacao,
  cod_usuariooriginal_serial
) VALUES (
  nextval('avlcontexecucaoetapaavaliador_seq'), 
  6,
  1,
  24836, --usuario responsavel pela avaliação
  '2024-06-03 16:53:27.132972-03',
  '2024-07-21 16:53:27.132972-03',
  NULL,
  'P',
  24836 -- usuario responsavel pela avaliação original
);

INSERT INTO avlcontexecucaoetapaavaliadorempresa (
  cod_avlcontexecucaoetapaavaliador_serial,
  cod_empresa_serial
) VALUES (
  542,
  28
);

INSERT INTO avlcontexecucaoetapaavaliadorcontrato (
  cod_avlcontexecucaoetapaavaliadorcontrato_serial,
  cod_avlcontexecucaoetapaavaliador_serial,
  cod_contratoassistencia_serial
)
SELECT
  nextval('avlcontexecucaoetapaavaliadorcontrato_seq'), 
  542,
  ca.cod_contratoassistencia_serial
FROM contratoassistencia ca
INNER JOIN avlcontexecucaoetapaavaliadorcontrato avl
  ON ca.cod_contratoassistencia_serial = avl.cod_contratoassistencia_serial
WHERE avl.cod_avlcontexecucaoetapaavaliador_serial = '230'
  AND ca.cod_empresa_serial = '28';


INSERT INTO avlcontexecucaoetapaavlcontquestionarioquestao (
  cod_avlcontexecucaoetapaavlcontquestionarioquestao_serial,
  cod_avlcontexecucaoetapaavaliadorcontrato_serial,
  cod_questionarioquestao_serial, 
  cod_questionarioquestaoresposta_serial,
  justificativa
)
SELECT
  nextval('avlcontexecucaoetapaavlcontquestionarioquestao_seq'),
  a.cod_avlcontexecucaoetapaavaliadorcontrato_serial,
  q.cod_questionarioquestao_serial,
  NULL,
  NULL
FROM avlcontexecucaoetapaavaliadorcontrato a
JOIN contratoassistencia ca
  ON ca.cod_contratoassistencia_serial = a.cod_contratoassistencia_serial
JOIN questionarioquestao q
  ON q.cod_questionario_serial = 1
WHERE a.cod_avlcontexecucaoetapaavaliador_serial = '542'
  AND ca.cod_empresa_serial = '28';

