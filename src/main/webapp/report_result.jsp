<%@ page import="java.util.*, com.model.student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Student Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 0;
            color: #e0f7fa;
        }

        h2 {
            text-align: center;
            margin-top: 40px;
            color: #00c9a7;
            font-size: 2rem;
            text-shadow: 1px 1px 3px #000;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            background-color: #1e2a38;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            font-size: 0.95rem;
            color: #e0f7fa;
        }

        th {
            background-color: #00c9a7;
            color: #1e2a38;
            font-weight: bold;
            text-shadow: none;
        }

        tr:nth-child(even) {
            background-color: #2a3a4d;
        }

        tr:nth-child(odd) {
            background-color: #243444;
        }

        .no-data {
            text-align: center;
            font-size: 1.2em;
            color: #b0bec5;
            margin-top: 60px;
        }

        .back-button {
            display: block;
            width: fit-content;
            margin: 40px auto;
            padding: 12px 30px;
            text-align: center;
            background-color: #00c9a7;
            color: #1e2a38;
            text-decoration: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
        }

        .back-button:hover {
            background-color: #00bfa6;
            transform: scale(1.05);
        }

        @media screen and (max-width: 768px) {
            table, th, td {
                font-size: 0.85rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .back-button {
                font-size: 0.9rem;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>

<h2>📋 Filtered Hostel Students Report</h2>

<%
    List<student> students = (List<student>) request.getAttribute("reportData");

    if (students != null && !students.isEmpty()) {
%>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Room No</th>
            <th>Admission Date</th>
            <th>Fees Paid</th>
            <th>Pending Fees</th>
        </tr>
        <%
            for (student s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getRoomNumber() %></td>
            <td><%= s.getAdmissionDate() %></td>
            <td><%= s.getFeesPaid() %></td>
            <td><%= s.getPendingFees() %></td>
        </tr>
        <% } %>
    </table>
<%
    } else {
%>
    <p class="no-data">🚫 No records found for the selected criteria.</p>
<%
    }
%>

<a href="report_form.jsp" class="back-button">← Back to Report Form</a>

</body>
</html>
