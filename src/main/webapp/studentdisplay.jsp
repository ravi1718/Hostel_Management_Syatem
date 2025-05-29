<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.student" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student List</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      margin: 0;
      padding: 40px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      color: #e0f7fa;
      min-height: 100vh;
    }

    h2 {
      color: #00c9a7;
      margin-bottom: 25px;
      font-size: 2em;
    }

    a {
      background-color: #00c9a7;
      color: #1e2a38;
      padding: 12px 24px;
      text-decoration: none;
      border-radius: 30px;
      font-weight: bold;
      font-size: 1rem;
      transition: background-color 0.3s ease, transform 0.2s;
      box-shadow: 0 6px 14px rgba(0, 201, 167, 0.3);
      margin-top: 25px;
    }

    a:hover {
      background-color: #00bfa6;
      color: #ffffff;
      transform: scale(1.03);
    }

    table {
      margin-top: 30px;
      border-collapse: collapse;
      width: 95%;
      max-width: 1000px;
      background-color: #1e2a38;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    }

    th, td {
      padding: 16px 24px;
      text-align: center;
      border-bottom: 1px solid #2f3e4e;
      color: #e0f7fa;
    }

    th {
      background-color: #2c3e50;
      font-weight: bold;
      color: #00c9a7;
      font-size: 1.1rem;
    }

    tr:hover {
      background-color: #2a3a4d;
    }

    td[colspan] {
      color: #b0bec5;
      font-style: italic;
    }

    @media screen and (max-width: 600px) {
      table, th, td {
        font-size: 0.9rem;
        padding: 12px 10px;
      }

      h2 {
        font-size: 1.5em;
      }
    }
  </style>
</head>
<body>

  <h2>🎓 Hostel Students</h2>

  <table>
    <tr>
      <th>Student ID</th>
      <th>Name</th>
      <th>Room Number</th>
      <th>Admission Date</th>
      <th>Fees Paid</th>
      <th>Pending Fees</th>
    </tr>

    <%
      List<student> students = (List<student>) request.getAttribute("studentsList");
      if (students != null && !students.isEmpty()) {
        for (student s : students) {
    %>
    <tr>
      <td><%= s.getId() %></td>
      <td><%= s.getName() %></td>
      <td><%= s.getRoomNumber() %></td>
      <td><%= s.getAdmissionDate() %></td>
      <td>₹ <%= s.getFeesPaid() %></td>
      <td>₹ <%= s.getPendingFees() %></td>
    </tr>
    <%
        }
      } else {
    %>
    <tr>
      <td colspan="6">No students found.</td>
    </tr>
    <%
      }
    %>
  </table>

  <a href="index.jsp">⬅️ Back to Home</a>

</body>
</html>
