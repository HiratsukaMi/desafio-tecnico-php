<?php
	$conexao = mysql_connect ("localhost", "root", "")
		or die ("Não conectado.");
	mysql_select_db ("teste")
		or die ("Banco não encontrado.");
?>