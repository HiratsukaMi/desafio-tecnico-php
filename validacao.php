<?php
	include("config.php");
	session_start();
	

	if($_SERVER["REQUEST_METHOD"] == "POST") {
      
      $user = mysqli_real_escape_string($db,$_POST['email']);
      $pass = mysqli_real_escape_string($db,$_POST['senha']); 
      
      $sql = "SELECT e.email [email], c.senha as [cadastrousuario] FROM email as e, cadastrousuario as c WHERE e = '$user' and c = '$pass'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $cont = mysqli_num_rows($result);
		
      if($cont == 1) {
         session_register("user");
         $_SESSION['email'] = $user;
         
         header("location: menuInicial.html");
      }else {
         $error = "Seu e-mail ou senha estão incorretos.";
      }
   }
?>