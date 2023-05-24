
<style>
</style>
<nav id="sidebar" class='mx-lt-5 bg-info	' >
		
		<div class="sidebar-list">

		<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home"></i></span> Inicio</a>
			<a href="index.php?page=attendance" class="nav-item nav-attendance"><span class='icon-field'><i class="fa fa-th-list"></i></span> Asistencia</a>
			<a href="index.php?page=ausencia" class="nav-item nav-ausencia"><span class='icon-field'><i class="fa fa-th-list"></i></span> Ausencias e incapacidades</a>
			
			<?php if($_SESSION['login_type'] == 1): ?>
				
				<a href="index.php?page=payroll" class="nav-item nav-payroll"><span class='icon-field'><i class="fa fa-columns"></i></span> Lista de Nóminas</a>
				<a href="index.php?page=employee" class="nav-item nav-employee"><span class='icon-field'><i class="fa fa-user-tie"></i></span> Lista de Empleados</a>
				<a href="index.php?page=indemniza" class="nav-item nav-indemnizaciones"><span class='icon-field'><i class="fa fa-money-bill-wave"></i></span> Indemnizaciones</a>		

				<a href="index.php?page=department" class="nav-item nav-department"><span class='icon-field'><i class="fa fa-columns"></i></span> Lista de Departamentos</a>
				<a href="index.php?page=position" class="nav-item nav-position"><span class='icon-field'><i class="fa fa-user-tie"></i></span> Lista de Posiciones</a>
				<!-- <a href="index.php?page=allowances" class="nav-item nav-allowances"><span class='icon-field'><i class="fa fa-list"></i></span> Lista de Asignaciones</a> -->
				<a href="index.php?page=deductions" class="nav-item nav-deductions"><span class='icon-field'><i class="fa fa-money-bill-wave"></i></span> Lista de Deducciones</a>		
				
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Usuarios</a>
			
			<?php endif; ?>
		</div>

</nav>
<script>
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
