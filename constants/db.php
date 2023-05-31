<!DOCTYPE html>
<html>
    <head>
        <style>

        </style>
    </head>
    <body>
        <form>
            <input type="text" name="username" placeholder="Username">
            <input type="password" name="password" placeholder="Password">
            <button type="submit">Login</button>
        </form>
</body>    



<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "idsystem";
$port = 3306;

$conn = mysqli_connect($servername, $username, $password, $dbname, $port);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}