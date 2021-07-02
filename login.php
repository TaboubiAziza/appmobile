<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    include "./db.php";
    $email=$_POST["email"];
    $pass=$_POST["password"];
    $query=$db->prepare("SELECT * from user WHERE user.email='".$email."' and user.password= '".$pass."';");
    $res=$query->execute();

    if($query->rowCount()>0){
        $data=$query->fetchAll(PDO::FETCH_ASSOC);
        //  print_r($data."-------");
        echo json_encode($data);
        //$data[0]['leavebalance']
        //$data[0]['authorizationbalance']
    }
}else {
    echo json_encode( $json['data']='note founde ');
}
//affected-row
?>