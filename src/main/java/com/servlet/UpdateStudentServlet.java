package com.servlet;

import com.dao.HostelDAO;
import com.model.student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String roomNumber = request.getParameter("roomNumber");
            String admissionDate = request.getParameter("admissionDate");
            double feesPaid = Double.parseDouble(request.getParameter("feesPaid"));
            double pendingFees = Double.parseDouble(request.getParameter("pendingFees"));

            student studentObj = new student(id, name, roomNumber, admissionDate, feesPaid, pendingFees);

            System.out.println("Attempting to update student: " + studentObj);

            boolean updated = hostelDAO.updateStudent(studentObj);

            if (updated) {
                // Set success message and forward to studentupdate.jsp
                request.setAttribute("message", "Student updated successfully!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("studentupdate.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("error", "Student not found or update failed for ID: " + id);
                RequestDispatcher dispatcher = request.getRequestDispatcher("studentupdate.jsp");
                dispatcher.forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("studentupdate.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error during student update", e);
        }
    }
}
