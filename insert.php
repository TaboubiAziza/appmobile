<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    require_once "../db.php";
    $from = $_POST['from'];
    $to=$_POST['to'];
    $description=$_POST['description'];
    $matricule =$_POST['matricule'];
    $sql="INSERT INTO `authorization`(`from`, `to`, `description`, `matricule`) VALUES ('$from','$to','$description','$matricule');";
    $res=$db->exec($sql);
    if($res){
        $sql2="UPDATE `user` SET authorizationbalance=0 WHERE user.matricule=".$matricule;
        $res2=$db->exec($sql2);
        if($res2)
        {
            $json['success']=1;
            $json['update']=true;
            $json['insert']=true;

            echo json_encode($json);
        }
        else
        {
            $json['success']=0;
            $json['update']=false;
            $json['insert']=true;
            echo json_encode($json);
        }
    }
    else {
        $json['success']=0;
        $json['update']=false;
        $json['insert']=false;
        echo json_encode($json);
    }
    //var_dump($res);
    //echo"sucess insert for student";}else
    //{echo"no method  post";
} else {
    echo "Method not supported !";
}
?>