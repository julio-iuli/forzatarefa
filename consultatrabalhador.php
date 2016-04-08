
<?php

	include "conecteforza.php";
	
	
	$query = "SELECT idtb_trab, nome FROM tb_trab;";
	
	if ($result = mysqli_query($link, $query)) {
		
		echo "<table border='1'>";
	
		while ($row = mysqli_fetch_assoc($result)) {
			echo "<tr>";
			echo "<td>" . $row["idtb_trab"] . "</td>";
			echo "<td>" . $row["nome"] . "</td>";			
			echo "</tr>";
		}
	
	}
	echo "</table>";
	
	mysqli_free_result($result);
	
	mysqli_close($link);
	
	;
?>

<h2><a href="trabalhador.html">Voltar</a></h2>
