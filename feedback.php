<?php

if(isset($_POST['submit-feedback']))
{
    $applicantid = $_POST['applicantid'];
    $rate = $_POST['rate'];
    $message = $_POST['message'];

    require_once './constants/feedback.func.php';
    require_once './constants/db.php';

    if(empty($applicantid)){
        echo "<script>alert('Applicant ID is required!')</script>";
    }
    else if(empty($rate)){
        echo "<script>alert('Rating is required!')</script>";
    }
    else if(empty($message)){
        echo "<script>alert('Message is required!')</script>";
    }
    else{
        $res = insertFeedback($conn, $applicantid, $rate, $message);
        if($res){
            header("Location: ../feedback.php");
        }
        else{
            echo "<script>alert('Failed to submit feedback!')</script>";
        }
    }
}
?>

<form method="post" action="<?php htmlspecialchars($_SERVER['PHP_SELF']) ?>">
    <div class="form-group">
        <label for="applicantid">Applicant ID</label>
        <input type="text" class="form-control" id="applicantid" name="applicantid" placeholder="Enter applicant ID">
    </div>
    <div class="form-group">
        <label for="rate">Rating</label>
        <input type="number" class="form-control" id="rate" name="rate" min="1" max="5" placeholder="Enter rating">
    </div>
    <div class="form-group">
        <label for="message">Message</label>
        <textarea class="form-control" id="message" name="message" placeholder="Enter message"></textarea>
    </div>
    <button type="submit" class="btn btn-primary" name="submit-feedback">Submit</button>
</form>