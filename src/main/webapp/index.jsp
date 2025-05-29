<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Management System</title>
    <style>
        /* Reset and base */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 0;
            text-align: center;
            color: #f0f0f0;
        }

        h1 {
            margin-top: 40px;
            font-size: 3em;
            color: #00c9a7;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .container {
            max-width: 650px;
            margin: 60px auto;
            background: #1e2a38;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.25);
        }

        ul {
            list-style: none;
            padding: 0;
            margin-top: 40px;
            text-align: center;
        }

        li {
            margin: 20px 0;
        }

        a {
            text-decoration: none;
            background-color: #00c9a7;
            color: #1e2a38;
            padding: 14px 30px;
            border-radius: 50px;
            font-size: 1.1em;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 10px rgba(0, 201, 167, 0.3);
            display: inline-block;
            width: 80%;
            box-sizing: border-box;
        }

        a:hover {
            background-color: #00bfa6;
            color: white;
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 14px rgba(0, 201, 167, 0.4);
        }

        /* Button-style link at bottom */
        .generate-report-container {
            margin-top: 50px;
            text-align: center;
        }

        .generate-report-button {
            display: inline-block;
            padding: 16px 45px;
            background-color: #00c9a7;
            color: #1e2a38;
            border-radius: 50px;
            font-size: 1.3em;
            font-weight: bold;
            box-shadow: 0 6px 14px rgba(0, 201, 167, 0.35);
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .generate-report-button:hover {
            background-color: #00bfa6;
            color: white;
            transform: scale(1.08);
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            .container {
                margin: 30px 20px;
                padding: 20px;
            }

            a {
                font-size: 1em;
                width: 100%;
            }

            .generate-report-button {
                width: 100%;
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Hostel Management System 🏢</h1>
        
        <ul>
            <li><a href="studentadd.jsp">Add Student</a></li>
            <li><a href="DisplayStudentsServlet">View Students</a></li>
            <li><a href="studentupdate.jsp">Update Student</a></li>
            <li><a href="studentdelete.jsp">Delete Student</a></li>
            <li><a href="ReportCriteriaServlet">Generate Report</a></li>
        </ul>
    </div>
</body>
</html>
