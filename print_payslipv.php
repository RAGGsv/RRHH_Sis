<style>
table{
    width:100%;
    border-collapse:collapse;
}
tr,td,th{
    border:1px solid black
}
.text-center{
    text-align:center;
}
.text-right{
    text-align:right;
}
</style>
<?php include 'db_connect.php' ?>

<?php
	$payroll=$conn->query("SELECT p.*,concat(e.lastname,', ',e.firstname,' ',e.middlename) as ename,e.employee_no FROM payroll_items p inner join employee e on e.id = p.employee_id  where p.id=".$_GET['id']);
	foreach ($payroll->fetch_array() as $key => $value) {
		$$key = $value;
	}
	$pay = $conn->query("SELECT * FROM payroll where id = ".$payroll_id)->fetch_array();
	$pt = array(1=>"Mensual",2=>"Quincenal");
?>

<div class="contriner-fluid">
	<div class="col-md-12">
		<h5><b><small>ID del empleado :</small><?php echo $employee_no ?></b></h5>
		<h4><b><small>Nombre: </small><?php echo ucwords($ename) ?></b></h4>
		<hr class="divider">

		<div class="row">
			
			<div class="col-md-6">
				<p><b>Planilla Ref : <?php echo $pay['ref_no'] ?></b></p>
				<p><b>Fechas : <?php echo date("M d, Y",strtotime($pay['date_from'])). " - ".date("M d, Y",strtotime($pay['date_to'])) ?></b></p>
				<p><b>Pago de planilla : <?php echo $pt[$pay['type']] ?></b></p>
			</div>
			<div class="col-md-6">
            <hr class="divider">
				<p><b>Salario : $<?php echo number_format($salary,2) ?></b></p>


				<p><b>AFP : $<?php echo $absent ?></b></p>
				<p><b>ISSS : $<?php echo $late ?></b></p>
				<p><b>Renta : $<?php echo number_format($allowance_amount,2) ?></b></p>
				<!--<p><b>Total deducciones $: <?php echo number_format($deduction_amount,2) ?></b></p>-->
                <hr class="divider">
				<p><b>Pago Neto : $<?php echo number_format($net,2) ?></b></p>
			</div>
		</div>
	

		
	</div>
	<hr>
</div>
