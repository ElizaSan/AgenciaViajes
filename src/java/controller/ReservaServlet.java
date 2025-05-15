package controller;

import model.Vuelo;
import model.VueloDAO;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fecha = request.getParameter("fecha");
        String numPasajerosStr = request.getParameter("numPasajeros");

        int numPasajeros = Integer.parseInt(numPasajerosStr);
        
        System.out.println("Fecha recibida: " + fecha);
        System.out.println("Número de pasajeros: " + numPasajeros);
        


        // Consultar vuelos disponibles para la fecha y número de pasajeros
        List<Vuelo> vuelosDisponibles = VueloDAO.buscarVuelosDisponibles(fecha, numPasajeros);

        request.setAttribute("vuelos", vuelosDisponibles);
        request.setAttribute("numPasajeros", numPasajeros);
        request.getRequestDispatcher("jsp/vuelos.jsp").forward(request, response);
    }
        
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
