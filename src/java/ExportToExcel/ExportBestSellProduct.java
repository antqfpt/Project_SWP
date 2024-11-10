/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ExportToExcel;

import dal.ReportCustomerDAO;
import dal.SalesReportDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CategorySales;
import model.ReportCustomer;
import model.TopSellingProduct;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author pqtru
 */
public class ExportBestSellProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SalesReportDAO dao = new SalesReportDAO();
        List<TopSellingProduct> top = dao.getTopSellingProducts();

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=ReportTopSellingProduct.xlsx");

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Report TopSellingProduct");
            String[] headerTitle = {"productName", "productImage", "categoryName", "totalQuantitySold", "productSales", "totalOrders"};
            Row headerRow = sheet.createRow(0);

            // Tạo tiêu đề cho các cột
            for (int i = 0; i < headerTitle.length; i++) {
                headerRow.createCell(i).setCellValue(headerTitle[i]);
            }

            int rowNum = 1;
            for (TopSellingProduct rp : top) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(rp.getProductImage());
                row.createCell(1).setCellValue(rp.getProductImage());

                row.createCell(2).setCellValue(rp.getCategoryName());
                row.createCell(3).setCellValue(rp.getTotalQuantitySold());
                row.createCell(4).setCellValue(rp.getTotalOrders());
                row.createCell(5).setCellValue(rp.getProductSales());
                
            }

            // Ghi tệp Excel ra response
            try (ServletOutputStream out = response.getOutputStream()) {
                workbook.write(out);
                out.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("mess", "Export failed: " + e.getMessage());
            request.getRequestDispatcher("page-report-bestselproduct.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}