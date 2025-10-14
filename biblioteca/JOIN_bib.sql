USE	biblioteca_anaclaragrizotto;	

SELECT Livro.titulo, Autor.nome, Categoria.nome, Usuario.nome, Emprestimo.data_emprestimo, Emprestimo.data_limite
FROM Livro
INNER JOIN Livro_Autor ON Livro.id_livro = Livro_Autor.id_livro
INNER JOIN Autor ON Autor.id_autor = Livro_Autor.id_autor

INNER JOIN Livro_Categoria ON Livro.id_livro = Livro_Categoria.id_livro
INNER JOIN Categoria ON Categoria.id_categoria = Livro_Categoria.id_categoria

INNER JOIN Emprestimo ON Emprestimo.id_livro = Livro.id_livro
INNER JOIN Usuario ON Usuario.id_usuario = Emprestimo.id_usuario


