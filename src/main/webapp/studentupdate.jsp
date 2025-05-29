<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Student</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 0;
            color: #e0f7fa;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: #1e2a38;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #00c9a7;
            margin-bottom: 30px;
            font-size: 1.8rem;
            text-shadow: 1px 1px 2px #000;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            color: #e0f7fa;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            margin-bottom: 20px;
            border: 1px solid #445566;
            border-radius: 10px;
            background: #2a3a4d;
            color: #e0f7fa;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.2);
        }

        input:focus {
            border-color: #00c9a7;
            outline: none;
            background-color: #2f4a5c;
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 30px;
            font-size: 1em;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-update {
            background-color: #00c9a7;
            color: #1e2a38;
            font-weight: bold;
        }

        .btn-update:hover {
            background-color: #00bfa6;
            transform: scale(1.03);
        }

        .btn-home {
            background-color: #607d8b;
            color: #fff;
            font-weight: bold;
        }

        .btn-home:hover {
            background-color: #546e7a;
            transform: scale(1.03);
        }

        .alert {
            margin-top: 25px;
            padding: 15px;
            background-color: #264653;
            color: #00c9a7;
            border-left: 5px solid #00c9a7;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🛠️ Update Student Details</h2>

    <form action="UpdateStudentServlet" method="post" novalidate>
        <label for="id">Student ID</label>
        <input type="number" id="id" name="id" required min="1">

        <label for="name">Student Name</label>
        <input type="text" id="name" name="name" required maxlength="100">

        <label for="roomNumber">Room Number</label>
        <input type="text" id="roomNumber" name="roomNumber" required maxlength="10">

        <label for="admissionDate">Admission Date</label>
        <input type="date" id="admissionDate" name="admissionDate" required>

        <label for="feesPaid">Fees Paid</label>
        <input type="number" step="0.01" id="feesPaid" name="feesPaid" required min="0">

        <label for="pendingFees">Pending Fees</label>
        <input type="number" step="0.01" id="pendingFees" name="pendingFees" required min="0">

        <div class="btn-group">
            <button type="submit" class="btn btn-update">Update</button>
            <a href="index.jsp" class="btn btn-home">Home</a>
        </div>
    </form>

    <% if (request.getAttribute("message") != null) { %>
        <div class="alert">
            <%= request.getAttribute("message") %>
        </div>
        <script>
            setTimeout(() => {
                window.location.href = 'index.jsp';
            }, 4000);
        </script>
    <% } %>
</div>
</body>
</html>
