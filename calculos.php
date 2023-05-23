<?php
    include 'conexion.php';

    $nombre = $mysqli -> real_escape_string ($_POST['nombre']);
    $DUI = $mysqli -> real_escape_string ($_POST['DUI']);
    $sexo = $mysqli -> real_escape_string ($_POST['sexo']);
    $salario = $mysqli -> real_escape_string ($_POST['salario']);
    $direccion = $mysqli -> real_escape_string ($_POST['direccion']);
    $telefono = $mysqli -> real_escape_string ($_POST['telefono']);
    $fecha_ingreso = $mysqli -> real_escape_string ($_POST['fecha_ingreso']);

    $AFPpatronal = $salario * 0.0875;
    
    if ($salario <= 999) {
        $ISSSpatronal = $salario * 0.075;
        $ISSSlaboral = $salario * 0.03;
    } else 
    if ($salario >= 1000) {
        $ISSSpatronal = 75;
        $ISSSlaboral = 30;
    }


    $AFPlaboral = $salario * 0.0725;
    $SalarioAFP = $salario - $AFPlaboral;
    $descuentototal = $ISSSlaboral + $AFPlaboral;
    $descuentocalculorenta = $salario - $ISSSlaboral - $AFPlaboral;

    if ($descuentocalculorenta <= 472.00) {
        $renta = 0;
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }
    elseif ($descuentocalculorenta > 472.00 and $descuentocalculorenta <=895.24) {
        $renta = ($descuentocalculorenta - 472) * 0.10 + 17.67;
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }
    elseif ($descuentocalculorenta > 895.24 and $descuentocalculorenta <= 2038.10) {  
        $renta = ($descuentocalculorenta - 895.24) * 0.20 + 60.00;
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }
    elseif ($descuentocalculorenta >= 2038.11) {
        $renta = ($descuentocalculorenta - 2038.10) * 0.30 + 288.57; 
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }

    $descuentototal = $descuentototal + $renta;

    $sql = "INSERT INTO empleado(nombre, DUI, sexo, salario, direccion, telefono, fecha_ingreso,
    afp_patronal, isss_patronal, isss_laboral, afp_laboral, salario_afp, descuento_total, renta, salario_liquido)
    VALUES('$nombre','$DUI','$sexo','$salario','$direccion','$telefono','$fecha_ingreso','$AFPpatronal',
    '$ISSSpatronal','$ISSSlaboral','$AFPlaboral','$SalarioAFP','$descuentototal','$renta','$salarioliquido')";

    $resultado = $mysqli->query($sql);

    $vacaciones = $salario*0.5*0.3;

    $salario = $salario + $vacaciones;

    $AFPpatronal = $salario * 0.0875;
        
    if ($salario <= 999) {
        $ISSSpatronal = $salario * 0.075;
        $ISSSlaboral = $salario * 0.03;
    } else 
    if ($salario >= 1000) {
        $ISSSpatronal = 75;
        $ISSSlaboral = 30;
    }


    $AFPlaboral = $salario * 0.0725;
    $SalarioAFP = $salario - $AFPlaboral;
    $descuentototal = $ISSSlaboral + $AFPlaboral;
    $descuentocalculorenta = $salario - $ISSSlaboral - $AFPlaboral;

    if ($descuentocalculorenta <= 472.00) {
        $renta = 0;
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }
    elseif ($descuentocalculorenta > 472.00 and $descuentocalculorenta <=895.24) {
        $renta = ($descuentocalculorenta - 472) * 0.10 + 17.67;
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }
    elseif ($descuentocalculorenta > 895.24 and $descuentocalculorenta <= 2038.10) {  
        $renta = ($descuentocalculorenta - 895.24) * 0.20 + 60.00;
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }
    elseif ($descuentocalculorenta >= 2038.11) {
        $renta = ($descuentocalculorenta - 2038.10) * 0.30 + 288.57; 
        $salarioliquido =  $salario - ($descuentototal + $renta);
    }

    $descuentototal = $descuentototal + $renta;

    $sql2 = "INSERT INTO vacaciones(nombre, DUI, sexo, vacaciones, salario, direccion, telefono, fecha_ingreso,
    afp_patronal, isss_patronal, isss_laboral, afp_laboral, salario_afp, descuento_total, renta, salario_liquido)
    VALUES('$nombre','$DUI','$sexo', $vacaciones,'$salario','$direccion','$telefono','$fecha_ingreso','$AFPpatronal',
    '$ISSSpatronal','$ISSSlaboral','$AFPlaboral','$SalarioAFP','$descuentototal','$renta','$salarioliquido')";



    $resultado = $mysqli->query($sql2);

    if($resultado>0){
        echo 'REGISTRO AGREGADO';
    } else{
        echo 'ERROR AL AGREGAR REGISTRO';
    }
    echo "<br/><a href='empleado.php' class='btn btn-primary'>Regresar</a>";
?>