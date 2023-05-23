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
<?php include('db_connect.php') ?>
<?php
		$pay = $conn->query("SELECT * FROM payroll where id = ".$_GET['id'])->fetch_array();
		$pt = array(1=>"Monhtly",2=>"Semi-Monthly");
?>
<div>
<h2 class="text-center">Planilla - <?php echo $pay['ref_no'] ?></h2>
<hr>
</div>
<table>
    <thead>
        <tr>
            <th class="text-center">ID del empleado</th>
            <th class="text-center">Nombrre</th>
            <th class="text-center">Salario Mensual</th>
            <th class="text-center">Ausencia</th>
            <th class="text-center">Tardanza (mins)</th>
            <th class="text-center">Prestaciones</th>
            <th class="text-center">Deducciones</th>
            <th class="text-center">Neto a Pagar</th>
        </tr>
    </thead>
    <tbody>
    <?php
									
        $payroll=$conn->query("SELECT p.*,concat(e.lastname,', ',e.firstname,' ',e.middlename) as ename,e.employee_no,e.salary FROM payroll_items p inner join employee e on e.id = p.employee_id ") or die(mysqli_error());
        while($row=$payroll->fetch_array()){
    ?>
    <tr>
        <td><?php echo $row['employee_no'] ?></td>
        <td><?php echo ucwords($row['ename']) ?></td>
        <td class="text-right"><?php echo number_format($row['salary'],2) ?></td>
        <td class="text-right"><?php echo $row['absent'] ?></td>
        <td class="text-right"><?php echo $row['late'] ?></td>
        <td class="text-right"><?php echo number_format($row['allowance_amount'],2) ?></td>
        <td class="text-right"><?php echo number_format($row['deduction_amount'],2) ?></td>
        <td class="text-right"><?php echo number_format($row['net'],2) ?></td>
    </tr>
    <?php
        }
    ?>
    </tbody>
</table>