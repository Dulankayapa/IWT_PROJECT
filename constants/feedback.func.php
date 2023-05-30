<?php

function insertFeedback($conn, $applicantid, $rate, $message)
{
    $date = date("Y-m-d H:i:s");
    $sql = "INSERT INTO Feedback (Applicant_ID, Feedback_Date, Rating, Comment) VALUES ('$applicantid', '$date', '$rate', '$message')";
    $result = mysqli_query($conn, $sql);
    return $result;
}

function getApplicantFeedbacks($conn, $applicantid)
{
    $sql = "SELECT * FROM Feedback WHERE Applicant_ID = '$applicantid'";
    $result = mysqli_query($conn, $sql);
    $rows= mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    return $rows;
}

function getFeedbackById($conn, $feedbackid)
{
    $sql = "SELECT * FROM Feedback WHERE Feedback_ID = '$feedbackid'";
    $result = mysqli_query($conn, $sql);
    $row= mysqli_fetch_assoc($result);
    mysqli_free_result($result);
    return $row;
}

function getFeedbacks($conn)
{
    $sql = "SELECT * FROM Feedback";
    $result = mysqli_query($conn, $sql);
    $rows= mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    return $rows;
}

?>