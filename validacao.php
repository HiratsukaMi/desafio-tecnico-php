<?php
	require_once ('config.php');

	if($_SERVER["REQUEST_METHOD"] == "POST") {
      
      $u = mysqli_real_escape_string($db,$_POST['user']);
      $p = mysqli_real_escape_string($db,$_POST['senha']); 
      
      $sql = "SELECT `email.idEmail`, `email.email`, `cadastrousuario.idUser`, `cadastrousuario.senha` FROM `email`, `cadastrousuario` WHERE `email.email` = '$u' and `cadastrousuario.senha` = '$p'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $cont = mysqli_num_rows($result);
		
      if($cont == 1) {
         session_register("u");
         $_SESSION['email'] = $u;
         
         header('location: inicio.html', true, 303);
		 die();
      }else {
         $erro = "Seu e-mail ou senha estão incorretos.";
		 die();
      }
   }
?>