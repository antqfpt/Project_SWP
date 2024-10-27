/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author pqtru
 */
public class OrderDAO extends DBContext {
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, c.customer_name, o.order_date, o.order_total_amount, o.order_status, e.employee_name, co.coupon_code, o.employee_id "
                + "FROM Orders o "
                + "LEFT JOIN Customers c ON o.customer_id = c.customer_id "
                + "LEFT JOIN Employees e ON o.employee_id = e.employee_id "
                + "LEFT JOIN CustomerCoupon cc ON o.customer_coupon_id = cc.customer_coupon_id "
                + "LEFT JOIN Coupons co ON cc.coupon_id = co.coupon_id";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setOrderDate(rs.getDate("order_date"));
                order.setOrderTotalAmount(rs.getInt("order_total_amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setEmployeeName(rs.getString("employee_name"));
                order.setCouponCode(rs.getString("coupon_code"));
                order.setEmployeeId(rs.getInt("employee_id"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close ResultSet, PreparedStatement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orders;
    }

    // Method to get a specific order by its ID including details
    public Order getOrderById(int orderId) {
        Order order = null;
        String sql = "SELECT o.order_id, c.customer_name, o.order_date, o.order_total_amount, o.order_status, e.employee_name, co.coupon_code, o.employee_id "
                + "FROM Orders o "
                + "LEFT JOIN Customers c ON o.customer_id = c.customer_id "
                + "LEFT JOIN Employees e ON o.employee_id = e.employee_id "
                + "LEFT JOIN CustomerCoupon cc ON o.customer_coupon_id = cc.customer_coupon_id "
                + "LEFT JOIN Coupons co ON cc.coupon_id = co.coupon_id "
                + "WHERE o.order_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setOrderDate(rs.getDate("order_date"));
                order.setOrderTotalAmount(rs.getInt("order_total_amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setEmployeeName(rs.getString("employee_name"));
                order.setCouponCode(rs.getString("coupon_code"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    // Method to get order details by orderId
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT p.product_name, od.quantity, od.unit_price, od.total_price "
                + "FROM OrdersDetails od "
                + "LEFT JOIN Products p ON od.product_id = p.product_id "
                + "WHERE od.order_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setProductName(rs.getString("product_name"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setUnitPrice(rs.getDouble("unit_price"));
                detail.setTotalPrice(rs.getDouble("total_price"));
                orderDetails.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public boolean updateOrderStatus(Order order) {
        String sql = "UPDATE Orders SET order_status = ? WHERE order_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, order.getOrderStatus());
            ps.setInt(2, order.getOrderId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteOrder(int orderId) {
        String deleteOrderDetailsSql = "DELETE FROM OrdersDetails WHERE order_id = ?";
        String deleteOrderSql = "DELETE FROM Orders WHERE order_id = ?";

        try {
            connection.setAutoCommit(false);

            // Delete order details first
            try (PreparedStatement psDetails = connection.prepareStatement(deleteOrderDetailsSql)) {
                psDetails.setInt(1, orderId);
                psDetails.executeUpdate();
            }

            // Then delete the order
            try (PreparedStatement psOrder = connection.prepareStatement(deleteOrderSql)) {
                psOrder.setInt(1, orderId);
                int rowsAffected = psOrder.executeUpdate();

                if (rowsAffected > 0) {
                    connection.commit();
                    return true;
                } else {
                    connection.rollback();
                    return false;
                }
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
    public int getTotalPriceOrder() {
        int totalPriceOrder = 0;
        String sql = "	select Sum(order_total_amount) as Total_Price_Order from Orders where order_status = 'Paid'";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalPriceOrder = rs.getInt("Total_Price_Order");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPriceOrder;
    }

    public double getTotalOrderSale() {
        double totalOrderSale = 0;
        String sql = "	SELECT COUNT(order_id) AS total_order_sales FROM Orders where order_status = 'Paid'";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                totalOrderSale = rs.getDouble("total_order_sales");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalOrderSale;
    }
    
    
    public double getTotalOrderAvg() {
        double totalAvg = 0;
        String sql = "SELECT Avg(Orders.order_total_amount) AS total_avg FROM Orders  where order_status = 'Paid'";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                totalAvg = rs.getDouble("total_avg");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalAvg;
    }
    
     public double getTotalMax() {
        double totalMax = 0;
        String sql = "SELECT MAX(Orders.order_total_amount) AS max_price FROM Orders  where order_status = 'Paid'";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                totalMax = rs.getDouble("max_price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalMax;
    }
    
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        double total = dao.getTotalMax();
        System.out.println(total);
    }
}
