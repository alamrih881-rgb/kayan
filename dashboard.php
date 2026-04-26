<?php
session_start();
if (!isset($_SESSION["user_id"])) {
header("Location: index.php"); exit();
}
?>
<h1>لوحة التحكم</h1>
<a href="logout.php">خروج</a>