package com.dao;

import com.model.student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/hosteldb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertStudent(student s) throws SQLException {
        String sql = "INSERT INTO hostelstudents (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, s.getId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getRoomNumber());
            ps.setDate(4, java.sql.Date.valueOf(s.getAdmissionDate()));
            ps.setDouble(5, s.getFeesPaid());
            ps.setDouble(6, s.getPendingFees());

            ps.executeUpdate();
        }
    }

    public boolean updateStudent(student s) throws SQLException {
        String sql = "UPDATE hostelstudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, java.sql.Date.valueOf(s.getAdmissionDate()));
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    // ✅ CORRECTED deleteStudent method
    public boolean deleteStudent(int id) throws SQLException {
        String sql = "DELETE FROM hostelstudents WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public student getStudentById(int id) throws SQLException {
        String sql = "SELECT * FROM hostelstudents WHERE StudentID=?";
        student s = null;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s = new student();
                    s.setId(rs.getInt("StudentID"));
                    s.setName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                }
            }
        }
        return s;
    }

    public List<student> getAllStudents() throws SQLException {
        List<student> students = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                student s = new student();
                s.setId(rs.getInt("StudentID"));
                s.setName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                students.add(s);
            }
        }
        return students;
    }

    public List<student> getStudentsWithPendingFees() throws SQLException {
        List<student> students = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents WHERE PendingFees > 0";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                student s = new student();
                s.setId(rs.getInt("StudentID"));
                s.setName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                students.add(s);
            }
        }
        return students;
    }

    public List<student> getStudentsByRoom(String roomNumber) throws SQLException {
        List<student> students = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents WHERE RoomNumber = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, roomNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    student s = new student();
                    s.setId(rs.getInt("StudentID"));
                    s.setName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    students.add(s);
                }
            }
        }
        return students;
    }

    public List<student> getStudentsByDateRange(String fromDate, String toDate) throws SQLException {
        List<student> students = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents WHERE AdmissionDate BETWEEN ? AND ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, java.sql.Date.valueOf(fromDate));
            stmt.setDate(2, java.sql.Date.valueOf(toDate));

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    student s = new student();
                    s.setId(rs.getInt("StudentID"));
                    s.setName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    students.add(s);
                }
            }
        }
        return students;
    }
}
