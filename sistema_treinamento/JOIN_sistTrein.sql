USE sistema_treinamentos;

-- EXERCICIO 1
SELECT alunos.nome as Aluno, turmas.nome as Turma
FROM alunos
INNER JOIN turmas ON alunos.turma_id = turmas.id;

-- EXERCICIO 2
SELECT atividades.descricao, turmas.nome as Turmas, materias.nome as Materia, instrutores.nome as Instrutor
FROM atividades
INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id;

-- EXERCICIO 3
SELECT instrutores.nome as Instrutor, materias.nome as Materia
FROM instrutores
INNER JOIN instrutor_materia ON instrutor_materia.instrutor_id = instrutores.id
INNER JOIN materias ON materias.id = instrutor_materia.materia_id;

-- EXERCICIO 4
SELECT atividades.descricao, instrutores.nome as Instrutor, instrutores.especialidade as Especialidade
FROM atividades
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id;

-- EXERCICIO 5
SELECT atividades.descricao, turmas.data_inicio, turmas.data_fim, materias.nome as Materia
FROM atividades
INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id;

-- EXERCICIO 6
SELECT alunos.nome as Aluno, turmas.nome as Turma, atividades.descricao as Atividade, materias.nome as Materia, instrutores.nome as Instrutor
FROM alunos
INNER JOIN turmas ON alunos.turma_id = turmas.id
INNER JOIN atividades ON atividades.turma_id = turmas.id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id;














