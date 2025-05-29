<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Add New Student</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0;
      color: #f0f0f0;
    }

    .form-container {
      background: #1e2a38;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.25);
      max-width: 500px;
      width: 100%;
    }

    h2 {
      text-align: center;
      color: #00c9a7;
      margin-bottom: 30px;
      font-size: 2em;
    }

    label {
      display: block;
      margin-top: 15px;
      margin-bottom: 6px;
      font-weight: 600;
      color: #cfd8dc;
      text-align: left;
    }

    input[type="text"],
    input[type="number"],
    input[type="date"] {
      width: 100%;
      padding: 12px 15px;
      border: 1.5px solid #3e5060;
      border-radius: 12px;
      font-size: 1rem;
      background-color: #263544;
      color: #f0f0f0;
      transition: border 0.3s, box-shadow 0.3s;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="date"]:focus {
      border-color: #00c9a7;
      box-shadow: 0 0 8px rgba(0, 201, 167, 0.4);
      outline: none;
    }

    input[type="submit"] {
      margin-top: 30px;
      width: 100%;
      background: #00c9a7;
      color: #1e2a38;
      padding: 14px;
      border: none;
      border-radius: 50px;
      font-size: 1.1rem;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      box-shadow: 0 6px 12px rgba(0, 201, 167, 0.3);
    }

    input[type="submit"]:hover {
      background: #00bfa6;
      color: white;
      transform: scale(1.05);
    }

    a {
      display: block;
      margin-top: 25px;
      text-align: center;
      color: #00c9a7;
      font-weight: 600;
      text-decoration: none;
      transition: color 0.3s;
    }

    a:hover {
      color: #00bfa6;
      text-decoration: underline;
    }

    @media screen and (max-width: 600px) {
      .form-container {
        padding: 30px 20px;
      }

      input[type="submit"] {
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>🧑‍🎓 Add New Student</h2>
    <form action="AddStudentServlet" method="post">
      <label for="studentId">Student ID:</label>
      <input type="number" id="studentId" name="studentId" required>

      <label for="studentName">Student Name:</label>
      <input type="text" id="studentName" name="studentName" required>

      <label for="roomNumber">Room Number:</label>
      <input type="text" id="roomNumber" name="roomNumber" required>

      <label for="admissionDate">Admission Date:</label>
      <input type="date" id="admissionDate" name="admissionDate" required>

      <label for="feesPaid">Fees Paid:</label>
      <input type="number" step="0.01" id="feesPaid" name="feesPaid" required>

      <label for="pendingFees">Pending Fees:</label>
      <input type="number" step="0.01" id="pendingFees" name="pendingFees" required>

      <input type="submit" value="➕ Add Student">
    </form>
    <a href="index.jsp">← Back to Home</a>
  </div>
</body>
</html>
