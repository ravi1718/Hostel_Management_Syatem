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

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        List<student> result = null;

        try {
            switch (reportType) {
                case "pendingFees":
                    result = hostelDAO.getStudentsWithPendingFees();
                    break;

                case "roomStudents":   // corrected to match your form value
                    String room = request.getParameter("roomNumber");
                    if (room != null && !room.trim().isEmpty()) {
                        result = hostelDAO.getStudentsByRoom(room.trim());
                    } else {
                        request.setAttribute("error", "Please enter a valid room number.");
                    }
                    break;

                case "dateRange":     // corrected to match your form value
                    String from = request.getParameter("startDate");
                    String to = request.getParameter("endDate");
                    if (from != null && to != null && !from.isEmpty() && !to.isEmpty()) {
                        result = hostelDAO.getStudentsByDateRange(from, to);
                    } else {
                        request.setAttribute("error", "Please provide both start and end dates.");
                    }
                    break;

                default:
                    request.setAttribute("error", "Invalid report type selected.");
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred while generating report.");
        }

        request.setAttribute("reportData", result);  // Changed to 'reportData' to match your JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
        dispatcher.forward(request, response);
    }
}
