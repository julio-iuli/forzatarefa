
<?php
	
	$link = mysqli_connect("localhost", "root", "", "forza");
	
	if (mysqli_connect_errno()) { 
		//retorna o numero do erro do sql se houver
		printf("Erro ao conectar ao banco de dados:<br> %s <br>", mysqli_connect_error());
		exit();
	}
	
	/*
	 * <script type="text/javascript">
			alert('tentando abrir o banco de dados');
		</script>
	*/
?>
