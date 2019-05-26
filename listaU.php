<?php

	include_once ('config.php');
	
	$sql = "SELECT * FROM `cadastrousuario`";
	$result = mysqli_query($con,$sql) or die("Não foi possível concluir a consulta.");
	while ($reg = mysqli_fetch_array($result)){
		$idU = $reg['idUser'];
		$nome = $reg['nameUser'];
		$rg = $reg['rgUser'];
		$cpf = $reg['cpfUser'];
		$nasc = $reg['dataNasc'];
		$idE = $reg['idEmp'];
		echo "ID: ". $idU . "\n";
		echo "Nome: " . $nome . "\n";
		echo "RG: " . $rg . "\n";
		echo "CPF: " . $cpf . "\n";
		echo "Data de Nascimento: " . $nasc . "\n";
		echo "Empresa: " . $idE . "\n";
	}
	mysqli_close($con);
	}
?>