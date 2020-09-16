/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phucldh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phucldh.daos.PostDAO;

/**
 *
 * @author nkokp
 */
public class AddServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String ADDPAGE = "add.jsp";
    private static final String ERRORPAGE = "error.jsp";

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
        String url = ERRORPAGE;

        try {
            int id = Integer.parseInt(request.getParameter("idPostDetail"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String content = request.getParameter("content");
//            content =  content.replaceAll("\\<[^>]*>","");
//            System.out.println(content);

            PostDAO post = new PostDAO();
            Calendar calendar = Calendar.getInstance();
            java.sql.Timestamp ourJavaTimestampObject = new java.sql.Timestamp(calendar.getTime().getTime());

            String mess = post.AddPost(id, title, author, content, ourJavaTimestampObject);

            if (title.length() == 0 || author.length() == 0 || content.length() == 0) {
                throw new Exception();
            }
            if (mess.equals("Insert successfully!")) {
                request.setAttribute("message", mess);
                url = ADDPAGE;

            } else {
                String message = "Opps! Something wrong happen or ID already exits! Please enter another!";
                request.setAttribute("message", message);
                url = ADDPAGE;
            }
        } catch (Exception ex) {
            log("AddServlet Exception: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
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
