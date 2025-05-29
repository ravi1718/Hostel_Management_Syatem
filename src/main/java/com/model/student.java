package com.model;

public class student {
    private int id;
    private String name;
    private String roomNumber;
    private String admissionDate;
    private double feesPaid;
    private double pendingFees;
    private String email;      // Optional, if you're storing email
    private String phone;      // Optional, if you're storing phone

    // Default constructor
    public student() {}

    // Parameterized constructor
    public student(int id, String name, String roomNumber, String admissionDate,
                   double feesPaid, double pendingFees) {
        this.id = id;
        this.name = name;
        this.roomNumber = roomNumber;
        this.admissionDate = admissionDate;
        this.feesPaid = feesPaid;
        this.pendingFees = pendingFees;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(String admissionDate) {
        this.admissionDate = admissionDate;
    }

    public double getFeesPaid() {
        return feesPaid;
    }

    public void setFeesPaid(double feesPaid) {
        this.feesPaid = feesPaid;
    }

    public double getPendingFees() {
        return pendingFees;
    }

    public void setPendingFees(double pendingFees) {
        this.pendingFees = pendingFees;
    }

    // Optional: if your project uses email/phone
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
