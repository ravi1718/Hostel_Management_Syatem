package com.servlet;

import com.dao.HostelDAO;
import com.model.student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/DisplayStudentsServlet")
public class DisplayStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<student> students = hostelDAO.getAllStudents();
            request.setAttribute("studentsList", students);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving students from database.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("studentdisplay.jsp");
        dispatcher.forward(request, response);
    }
}
