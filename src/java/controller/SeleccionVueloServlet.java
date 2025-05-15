package controller;

import model.ReservaDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SeleccionVueloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int vueloId = Integer.parseInt(request.getParameter("vueloId"));
        int numPasajeros = Integer.parseInt(request.getParameter("numPasajeros"));

        int reservaId = ReservaDAO.crearReserva(vueloId, numPasajeros);

        if (reservaId != -1) {
            request.setAttribute("reservaId", reservaId);
            request.getRequestDispatcher("jsp/pago.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se pudo reservar el vuelo.");
            request.getRequestDispatcher("jsp/vuelos.jsp").forward(request, response);
        }

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
