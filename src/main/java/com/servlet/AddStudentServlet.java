package com.servlet;

import com.dao.HostelDAO;
import com.model.student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    private HostelDAO hostelDAO;

    @Override
    public void init() throws ServletException {
        hostelDAO = new HostelDAO();  // Initialize DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Read form parameters
            String idStr = request.getParameter("studentId");
            String name = request.getParameter("studentName");
            String roomNumber = request.getParameter("roomNumber");
            String admissionDate = request.getParameter("admissionDate"); // Expected format: yyyy-MM-dd
            String feesPaidStr = request.getParameter("feesPaid");
            String pendingFeesStr = request.getParameter("pendingFees");

            // Validate all fields
            if (idStr == null || name == null || roomNumber == null || admissionDate == null ||
                feesPaidStr == null || pendingFeesStr == null ||
                idStr.trim().isEmpty() || name.trim().isEmpty() || roomNumber.trim().isEmpty() ||
                admissionDate.trim().isEmpty() || feesPaidStr.trim().isEmpty() || pendingFeesStr.trim().isEmpty()) {
                out.println("<h3 style='color:red;'>Error: All fields are required.</h3>");
                return;
            }

            // Parse values
            int id = Integer.parseInt(idStr);
            double feesPaid = Double.parseDouble(feesPaidStr);
            double pendingFees = Double.parseDouble(pendingFeesStr);

            // Create student object
            student s = new student(id, name, roomNumber, admissionDate, feesPaid, pendingFees);

            // Insert into database
            hostelDAO.insertStudent(s);

            // Success message or redirect
            
            out.println("<div style='text-align:center; padding: 40px; font-family: \"Segoe UI\", Tahoma, Geneva, Verdana, sans-serif; background-color: #fff0f6; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); max-width: 400px; margin: 50px auto;'>");
            out.println("<h3 style='color: #e91e63; font-size: 1.6rem; margin-bottom: 25px;'> Student added successfully</h3>");
            out.println("<a href='index.jsp' style='display: inline-block; padding: 12px 25px; background-color: #e91e63; color: white; text-decoration: none; border-radius: 7px; font-weight: 600; font-size: 1.1rem; transition: background-color 0.3s;'> Back to Home</a>");
            out.println("<style>");
            out.println("a:hover { background-color: #b0003a; }");
            out.println("</style>");
            out.println("</div>");


          


        } catch (NumberFormatException e) {
            out.println("<h3 style='color:red;'>Invalid number format in input: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h3 style='color:red;'>Database error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
