<?php

	function connect($host,$usr,$pw,$db) { 
		try { 
			$mysqli = new mysqli($host,$usr,$pw,$db); 
			$connected = true; 
		} catch (mysqli_sql_exception $e) { 
			throw $e; 
		} 
	} 

	try { 
		connect('localhost','root','root','teste'); 
		echo 'Connected to database'; 
	} catch (Exception $e) { 
		echo $e->errorMessage(); 
	}  
?>