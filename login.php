<?php
session_start();
require "config.php";
if ($_POST) {
$stmt = $conn->prepare("SELECT * FROM users WHERE username=?");
$stmt->execute([$_POST["username"]]);
$user = $stmt->fetch();
if ($user && password_verify($_POST["password"], $user["password"])) {
$_SESSION["user_id"] = $user["id"];
header("Location: dashboard.php");
} else { echo "خطأ"; }
}
?>