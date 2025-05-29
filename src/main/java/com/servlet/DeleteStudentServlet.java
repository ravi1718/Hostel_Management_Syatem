package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        deleteStudent(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        deleteStudent(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message;
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            boolean isDeleted = hostelDAO.deleteStudent(id); // update this to return true/false

            if (isDeleted) {
                message = "✅ Student deleted successfully.";
            } else {
                message = "❌ Invalid student ID. Student not found.";
            }

        } catch (NumberFormatException e) {
            message = "❌ Invalid input. Please enter a valid student ID.";
        } catch (SQLException e) {
            message = "❌ Error occurred while deleting student. Please try again.";
            e.printStackTrace();
        }

        // Set the message in request scope
        request.setAttribute("message", message);

        // Forward to delete.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("studentdelete.jsp");
        dispatcher.forward(request, response);
    }
}
