<!-- Define que el documento esta bajo el estandar de HTML 5 -->
<!doctype html>

<!-- Representa la raíz de un documento HTML o XHTML. Todos los demás elementos deben ser descendientes de este elemento. -->
<html lang="es">
    
    <head>
        
        <meta charset="utf-8">
        
        <title> Sistema de Planillas - UES -  RRHH - 2023 </title>    
        <?php include('./header.php'); ?>
        <?php include('./db_connect.php'); ?>
        <?php 
        session_start();
        if(isset($_SESSION['login_id']))
        header("location:index.php?page=home");

        ?>


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
        <link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet"> 
        
        <!-- Link hacia el archivo de estilos css -->
        <link rel="stylesheet" href="css/login.css">
        
        <style type="text/css">
            
        </style>
        
        <script type="text/javascript">
        
        </script>
        
    </head>
    
    <body>
    
        <div id="contenedor">
            
            <div id="contenedorcentrado">
                <div id="login">
                    <form id="login-form">
                        <label for="usuario">Usuario</label>
                        <input type="text" id="username" name="username" class="form-control" placeholder="Usuario" required>
                        
                        <label for="password">Contraseña</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Contraseña" required>
                        
                        <button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Acceder</button>
                    </form>
                    
                </div>
                <div id="derecho">
                    <div class="titulo">
                        Bienvenido
                    </div>
                    <hr>
                    <div class="pie-form">
                        <a >Sistema de Planillas</a>
                        <a >Envasadora de agua "Los Cocos"</a>
                        <hr>
                        <a >Copyright © 2023 - UES - RRHH</a>
                    </div>
                </div>
            </div>
        </div>
        
    </body>

    <script>
	$('#login-form').submit(function(e){
		e.preventDefault()
		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		$.ajax({
			url:'ajax.php?action=login',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
		$('#login-form button[type="button"]').removeAttr('disabled').html('Login');

			},
			success:function(resp){
				if(resp == 1){
					location.href ='index.php?page=home';
				}else if(resp == 2){
					location.href ='voting.php';
				}else{
					$('#login-form').prepend('<div class="alert alert-danger">Usuario o contraseña incorrecta.</div>')
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		})
	})
</script>	


</html>