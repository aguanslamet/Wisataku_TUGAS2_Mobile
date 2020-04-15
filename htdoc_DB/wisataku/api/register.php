<?php

require "../config/connect.php";
if ($_SERVER['REQUEST_METHOD']=="POST"){
    $response =array();
    $nohp =$_POST['nohp'];
    $password =md5($_POST['password']);
    $username = $_POST['username'];

    // $image = date('dmYHis').str_replace(" ","", basename($_FILES['image']['name']));
    // $imagePath = "../upload/.$image";
    // move_uploaded_file($_FILES['image']['tap_name'],$imagePath);


    $cek ="SELECT * FROM akun WHERE nohp ='$nohp'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));
    if (isset($result)) {
        # code...
        $response['value']=2;
        $response['massage']="nomor anda telah di gunakan";
        echo json_encode($response);
    } else {
        # code...
        $sql ="INSERT INTO akun VALUE('','$nohp','$password','1','$username','1','NOW()')";
        if (mysqli_query( $con, $sql)) {
            $response['value']=1;
            $response['massage']="berhasil daftar";
            echo json_encode($response);
            # code...
        } else {
            # code...
            $response['value']=0;
            $response['massage']="gagal daftar";
            echo json_encode($response);
        }
        
    }
}
          
?>