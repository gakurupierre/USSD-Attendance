<?php

include 'db.php';
header("content-type: application/json");

$method= $_SERVER['REQUEST_METHOD'];
$input= json_decode(file_get_contents('php://input'),true);
switch($method){
  case 'GET':
    if (isset($_GET['id'])) {
     $id=$_GET['id'];
     $result= $conn->query("SELECT * FROM users WHERE id=$id");
     $data= $result->fetch_assoc();
     echo json_encode($data);
    }else{
      $result =$conn->query("SELECT * FROM users");
      $users = [];
      while ($row = $result->fetch_assoc()){
        $users[]= $row;
      }
     echo json_encode($users);

    }
    break;

    case 'POST':
    $name= $input['name'];
    $email= $input['email'];
    $age= $input['age'];
    $conn->query("INSERT INTO users (name, email, age) VALUES ('$name','$email','$age')");
    echo json_encode(["message" => "User added successfully"]);
    break;

    case 'PUT':
    $id = isset($input['id']) ? $input['id'] : null;
    $name = $input['name'];
    $email = $input['email'];
    $age = $input['age'];
    if ($id !== null) {
        $conn->query("UPDATE users SET name='$name', email='$email', age='$age' WHERE id='$id'");
        echo json_encode(["message" => "User updated successfully"]);
    } else {
        echo json_encode(["error" => "User ID is required for update"]);
    }
    break;

    case 'DELETE':
      $id = isset($input['id']) ? $input['id'] : null;
      $conn->query("DELETE FROM users WHERE id='$id'");
       echo json_encode(["message" => "User deleted successfully"]);
    break;
      
  default:
   echo json_encode(["message" => "Invalid request method"]);
    break;

}
$conn->close();

?> 
