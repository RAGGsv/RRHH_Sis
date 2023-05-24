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
		<button class="btn btn-success btn-sm btn-block col-md-2 float-right" type="button" id="print_payslip_btn">
		<span class="fa fa-print"></span> Imprimir
</button>

		<div class="row">
			
			<div class="col-md-6">
				<p><b>Planilla Ref : <?php echo $pay['ref_no'] ?></b></p>
				<p><b>Fechas : <?php echo date("M d, Y",strtotime($pay['date_from'])). " - ".date("M d, Y",strtotime($pay['date_to'])) ?></b></p>
				<p><b>Pago de planilla : <?php echo $pt[$pay['type']] ?></b></p>
			</div>
			<div class="col-md-6">
				<p><b>Salario : $<?php echo number_format($salary,2) ?></b></p>


				<p><b>AFP : $<?php echo $absent ?></b></p>
				<p><b>ISSS : $<?php echo $late ?></b></p>
				<p><b>Renta : $<?php echo number_format($allowance_amount,2) ?></b></p>
				<!--<p><b>Total deducciones $: <?php echo number_format($deduction_amount,2) ?></b></p>-->
				<p><b>Pago Neto : $<?php echo number_format($net,2) ?></b></p>
			</div>
		</div>
	

		<hr class="divider">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<span><b>Beneficios</b></span>
						
					</div>
					<div class="card-body">
						<ul class="list-group">
							<?php
							$all_qry = $conn->query("SELECT * from allowances ");
							$t_arr = array(1=>"Monthly",2=>"Semi-Monthly",3=>"Once");
							while($row=$all_qry->fetch_assoc()):
								$all_arr[$row['id']] = $row['allowance'];
						 	endwhile; 
						 	foreach(json_decode($allowances) as $k => $val):

							?>
							<li class="list-group-item d-flex justify-content-between align-items-center">
						   <?php echo $all_arr[$val->aid] ?> Beneficio
					    <span class="badge badge-primary badge-pill"><?php echo number_format($val->amount,2) ?></span>
					  </li>
						  
						<?php endforeach; ?>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<span><b>Deducciones</b></span>
						
					</div>
					<div class="card-body">
						<ul class="list-group">
							<?php
							$all_qry = $conn->query("SELECT * from deductions ");
							$t_arr = array(1=>"Monthly",2=>"Semi-Monthly",3=>"Once");
							while($row=$all_qry->fetch_assoc()):
								$ded_arr[$row['id']] = $row['deduction'];
						 	endwhile; 
						 	foreach(json_decode($deductions) as $k => $val):

							?>
							<li class="list-group-item d-flex justify-content-between align-items-center">
						   <?php echo $ded_arr[$val->did] ?>
					    <span class="badge badge-primary badge-pill"><?php echo number_format($val->amount,2) ?></span>
					  </li>
						  
						<?php endforeach; ?>
						</ul>
					</div>
				</div>
			</div>
		
		</div>
	</div>
	<hr>
			<div class="row">
				<div class="col-lg-12">
					<button class="btn btn-primary btn-sm btn-block col-md-2 float-right" type="button" data-dismiss="modal">Cerrar</button>
				</div>
			</div>
</div>
<style type="text/css">
	.list-group-item>span>p{
		margin:unset;
	}
	.list-group-item>span>p>small{
		font-weight: 700
	}
	#uni_modal .modal-footer{
		display: none;
	}
	.alist,.dlist{
		width: 100%
	}
</style>