<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Generate Student Reports</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      color: #e0f7fa;
    }

    .form-container {
      background-color: #1e2a38;
      padding: 40px 50px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
      width: 100%;
      max-width: 600px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #00c9a7;
      font-size: 1.8rem;
      text-shadow: 1px 1px 3px #000;
    }

    form label {
      font-size: 1rem;
      color: #b0bec5;
      display: block;
      margin: 12px 0 5px;
    }

    .radio-group {
      margin-bottom: 25px;
      border-bottom: 1px solid #37474f;
      padding-bottom: 15px;
    }

    input[type="radio"] {
      margin-right: 10px;
      accent-color: #00c9a7;
    }

    input[type="text"],
    input[type="date"] {
      width: 100%;
      padding: 10px 12px;
      border: 1px solid #455a64;
      border-radius: 8px;
      font-size: 1rem;
      background-color: #2a3a4d;
      color: #e0f7fa;
      box-shadow: inset 0 1px 3px rgba(0,0,0,0.2);
    }

    input[type="text"]:focus,
    input[type="date"]:focus {
      border-color: #00c9a7;
      outline: none;
      background-color: #2f4a5c;
    }

    input[type="submit"] {
      width: 100%;
      padding: 14px;
      background-color: #00c9a7;
      color: #1e2a38;
      font-size: 1.1rem;
      font-weight: bold;
      border: none;
      border-radius: 30px;
      cursor: pointer;
      margin-top: 20px;
      transition: background-color 0.3s, transform 0.2s;
      box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.2);
    }

    input[type="submit"]:hover {
      background-color: #00bfa6;
      transform: scale(1.03);
    }

    .back-link {
      text-align: center;
      display: block;
      margin-top: 25px;
      text-decoration: none;
      font-size: 1rem;
      font-weight: bold;
      color: #4fc3f7;
      transition: color 0.3s;
    }

    .back-link:hover {
      color: #29b6f6;
    }

    @media screen and (max-width: 600px) {
      .form-container {
        padding: 30px 20px;
      }

      h2 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>📊 Generate Student Report</h2>

    <form action="ReportServlet" method="post">

      <div class="radio-group">
        <label>
          <input type="radio" name="reportType" value="pendingFees" required>
          Students with Pending Fees
        </label>
      </div>

      <div class="radio-group">
        <label>
          <input type="radio" name="reportType" value="roomStudents" required>
          Students in a Particular Room
        </label>
        <input type="text" name="roomNumber" placeholder="Enter Room Number">
      </div>

      <div class="radio-group">
        <label>
          <input type="radio" name="reportType" value="dateRange" required>
          Students Admitted Between Dates
        </label>
        <label>From:</label>
        <input type="date" name="startDate">
        <label>To:</label>
        <input type="date" name="endDate">
      </div>

      <input type="submit" value="Generate Report">
    </form>

    <a href="index.jsp" class="back-link">⬅️ Back to Home</a>
  </div>

</body>
</html>
