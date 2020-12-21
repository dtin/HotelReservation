/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tindd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import tindd.tblOrders.TblOrdersDAO;

/**
 *
 * @author Tin
 */
@WebServlet(name = "ActivationServlet", urlPatterns = {"/ActivationServlet"})
public class ActivationServlet extends HttpServlet {

    private final Logger LOGGER = Logger.getLogger(ActivationServlet.class);

    private final String ORDER_RESULT = "order-result";

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ServletContext context = request.getServletContext();
        Map<String, String> addressMap;

        String userId = request.getParameter("userId");
        String orderId = request.getParameter("orderId");
        String activationCodeStr = request.getParameter("activationCode");

        TblOrdersDAO ordersDAO;

        boolean result = false;

        String url = ORDER_RESULT;
        String activationCode;

        try {
            ordersDAO = new TblOrdersDAO();
            activationCode = ordersDAO.getActivationCode(userId, orderId);
            if (activationCode != null && activationCode.equals(activationCodeStr)) {
                result = ordersDAO.setActiveOrder(orderId);
                if (result) {
                    request.setAttribute("ORDER_STATUS", result);
                    request.setAttribute("ORDER_ID", orderId);
                }
            } else {
                request.setAttribute("ORDER_STATUS", result);
            }
        } catch (SQLException ex) {
            LOGGER.error("SQLException: " + ex.getMessage());
        } catch (NamingException ex) {
            LOGGER.error("NamingException: " + ex.getMessage());
        } finally {
            addressMap = (Map<String, String>) context.getAttribute("ADDRESS_MAP");
            String realAddress = addressMap.get(url);

            RequestDispatcher rd = request.getRequestDispatcher(realAddress);
            rd.forward(request, response);

            out.close();
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
