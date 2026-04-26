<?php require "config.php"; ?>
<form method="POST">
<textarea name="notes"></textarea>
<button>حفظ</button>
</form>
<?php
if ($_POST) {
$stmt = $conn->prepare("INSERT INTO visitor_logs (visit_type, notes, visit_date) VALUES ('استطلاعي', ?, NOW())");
$stmt->execute([$_POST["notes"]]);
echo "تم";
}
?>