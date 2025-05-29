<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Delete Student</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 40px 20px;
      margin: 0;
      min-height: 100vh;
      color: #f0f0f0;
    }

    h2 {
      color: #00c9a7;
      margin-bottom: 30px;
      font-size: 2em;
    }

    form {
      background-color: #1e2a38;
      padding: 30px 40px;
      border-radius: 16px;
      box-shadow: 0 10px 24px rgba(0, 0, 0, 0.25);
      width: 100%;
      max-width: 420px;
      box-sizing: border-box;
    }

    label {
      font-weight: bold;
      color: #cfd8dc;
      display: block;
      margin-bottom: 10px;
      font-size: 1.1rem;
    }

    input[type="number"] {
      width: 100%;
      padding: 12px;
      font-size: 1rem;
      border-radius: 10px;
      border: 1.5px solid #3e5060;
      background-color: #263544;
      color: #f0f0f0;
      margin-bottom: 20px;
      transition: border-color 0.3s ease, box-shadow 0.3s;
    }

    input[type="number"]:focus {
      border-color: #00c9a7;
      box-shadow: 0 0 8px rgba(0, 201, 167, 0.4);
      outline: none;
    }

    input[type="submit"] {
      background-color: #00c9a7;
      color: #1e2a38;
      font-weight: bold;
      border: none;
      padding: 14px;
      width: 100%;
      border-radius: 50px;
      font-size: 1.1rem;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s;
      box-shadow: 0 6px 12px rgba(0, 201, 167, 0.3);
    }

    input[type="submit"]:hover {
      background-color: #00bfa6;
      color: #fff;
      transform: scale(1.03);
    }

    a {
      display: inline-block;
      margin-top: 25px;
      text-decoration: none;
      color: #00c9a7;
      font-weight: 600;
      font-size: 1rem;
      transition: color 0.3s ease;
    }

    a:hover {
      color: #00bfa6;
      text-decoration: underline;
    }

    .message {
      max-width: 420px;
      padding: 15px 20px;
      border-radius: 10px;
      margin-bottom: 25px;
      font-weight: 600;
      box-sizing: border-box;
      text-align: center;
    }

    .success-message {
      background-color: #1c3f2a;
      border: 1px solid #28a745;
      color: #a5e3b0;
    }

    .error-message {
      background-color: #512c30;
      border: 1px solid #dc3545;
      color: #f5b5b8;
    }

    @media screen and (max-width: 500px) {
      form {
        padding: 25px 20px;
      }

      h2 {
        font-size: 1.6em;
      }
    }
  </style>
</head>
<body>

  <h2>🗑️ Delete Student</h2>

  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
      String cssClass = message.toLowerCase().contains("success") ? "success-message" : "error-message";
  %>
    <div class="message <%= cssClass %>"><%= message %></div>
  <% } %>

  <form action="DeleteStudentServlet" method="post" novalidate>
    <label for="id">Enter Student ID to Delete:</label>
    <input type="number" id="id" name="id" min="1" required aria-required="true" />
    <input type="submit" value="🗑️ Delete Student" />
  </form>

  <a href="index.jsp">⬅️ Back to Home</a>

</body>
</html>
