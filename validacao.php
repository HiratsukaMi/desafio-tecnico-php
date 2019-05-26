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
      
      $count = mysqli_num_rows($result);
		
      if($count == 1) {
         session_register("user");
         $_SESSION['login_user'] = $user;
         
         header("location: menuInicial.php");
      }else {
         $error = "Seu e-mail ou senha estão incorretos.";
      }
   }
?>