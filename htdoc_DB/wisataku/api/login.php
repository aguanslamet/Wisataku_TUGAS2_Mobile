<?php

require "../config/connect.php";
if ($_SERVER['REQUEST_METHOD']=="POST"){
    $response= array();
    $nohp =$_POST['nohp'];
    $password = md5($_POST["password"]);
    $cek ="SELECT * FROM akun WHERE nohp ='$nohp' and password='$password'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));
    if (isset($result)) {
        # code...
        $response['value']=1;
        $response['massage']="Login Berhasil";
        $response['username']=$result['username'];
        $response['nohp']=$result['nohp'];
        echo json_encode($response);
    } else{
        $response['value']=0;
        $response['massage']="Login Gagal";
        echo json_encode($response);  
    }
} 
?>