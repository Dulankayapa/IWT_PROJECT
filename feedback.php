<?php

if (isset($_POST['submit-feedback'])) {
    $applicantid = $_POST['applicantid'];
    $rate = $_POST['rate'];
    $message = $_POST['message'];

    require_once './constants/feedback.func.php';
    require_once './constants/db.php';

    if (empty($applicantid)) {
        echo "<script>alert('Applicant ID is required!')</script>";
    } else if (empty($rate)) {
        echo "<script>alert('Rating is required!')</script>";
    } else if (empty($message)) {
        echo "<script>alert('Message is required!')</script>";
    } else {
        $res = insertFeedback($conn, $applicantid, $rate, $message);
        if ($res) {
            header("Location: ./feedback.php");
        } else {
            echo "<script>alert('Failed to submit feedback!')</script>";
        }
    }
}
?>
<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            background-image:url(data:image/jpeg;base64,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 );
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #fcfcfc;
        }

        .container h2 {
            text-align: center;
        }

        .container label {
            display: block;
            margin-bottom: 10px;
        }

        .container input[type="text"],
        .container input[type="number"],
        .container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
        }

        .container textarea {
            resize: vertical;
        }


        .container button {
            display: block;
            width: 75px;
            padding: 10px;
            background-color: #38b5cb;
            color: white;
            border: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <form method="post" action="<?php htmlspecialchars($_SERVER['PHP_SELF']) ?>">
            <div class="form-group">
                <label for="applicantid">Applicant ID</label>
                <input type="text" class="form-control" id="applicantid" name="applicantid"
                    placeholder="Enter applicant ID">
            </div>
            <div class="form-group" id="rating"
                style="display:flex; flex-direction: row; justify-content: space-between;"></div>
            <input type="number" id="rate" name="rate" hidden>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" id="message" rows="10" name="message"
                    placeholder="Enter message"></textarea>
            </div>
            <button type="submit" class="btn btn-primary" name="submit-feedback">Submit</button>
        </form>
        <script>
            var ele = document.getElementById("rating");
            var rateval = document.getElementById("rate");
            for (i = 1; i <= 5; i++) {
                ele.innerHTML += `<label for=\"rate${i}\" onclick=\"onRateSet(${i})\"> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-star\" viewBox=\"0 0 576 512\">${getStar(true)}</svg></label>`;
            }

            function getStar(dark) {
                if (dark) return "<path d=\"M287.9 0c9.2 0 17.6 5.2 21.6 13.5l68.6 141.3 153.2 22.6c9 1.3 16.5 7.6 19.3 16.3s.5 18.1-5.9 24.5L433.6 328.4l26.2 155.6c1.5 9-2.2 18.1-9.6 23.5s-17.3 6-25.3 1.7l-137-73.2L151 509.1c-8.1 4.3-17.9 3.7-25.3-1.7s-11.2-14.5-9.7-23.5l26.2-155.6L31.1 218.2c-6.5-6.4-8.7-15.9-5.9-24.5s10.3-14.9 19.3-16.3l153.2-22.6L266.3 13.5C270.4 5.2 278.7 0 287.9 0zm0 79L235.4 187.2c-3.5 7.1-10.2 12.1-18.1 13.3L99 217.9 184.9 303c5.5 5.5 8.1 13.3 6.8 21L171.4 443.7l105.2-56.2c7.1-3.8 15.6-3.8 22.6 0l105.2 56.2L384.2 324.1c-1.3-7.7 1.2-15.5 6.8-21l85.9-85.1L358.6 200.5c-7.8-1.2-14.6-6.1-18.1-13.3L287.9 79z\" />";
                else return "<path d=\"M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z\"/>";
            }
            // click star
            function onRateSet(v) {
                rateval.value = v;
                console.log(v);
                ele.innerHTML = "";
                for (i = 1; i <= 5; i++) {
                    ele.innerHTML += `<label for=\"rate${i}\" onclick=\"onRateSet(${i})\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-star\" viewBox=\"0 0 576 512\">${getStar(v < i)}</svg></label>`;
                }
            }

        </script>
    </div>
</body>

</html>