<?php


	include "conecteforza.php";
	
	$nome = $_POST["nome"];
	$query = "INSERT INTO tb_trab(nome) VALUE('$nome');";
	if ($result = mysqli_query($link, $query)) {
		echo "Nome incluído com sucesso!!";
	}
	mysqli_close($link);
	
/*	
	$stmt = mysqli_stmt_prepare($link, "INSERT INTO tb_trab(nome) VALUE(?)");
	
	mysqli_stmt_bind_param($stmt, "s", $nome);
	
	$nome = $_POST["nome"];
	echo $nome;
	
	mysqli_stmt_execute($stmt);
	
	printf("%d Row inserted.\n", mysqli_stmt_affected_rows($stmt));
	
	mysqli_stmt_close($stmt);	
	
	mysqli_close($link);	
*/
?>

<h2><a href="trabalhador.html">Voltar</a></h2>
