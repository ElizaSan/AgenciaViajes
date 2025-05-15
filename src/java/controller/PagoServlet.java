package controller;

import model.Reserva;
import model.ReservaDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PagoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String reservaIdStr = request.getParameter("reservaId");
        int reservaId = Integer.parseInt(reservaIdStr);

        String tarjeta = request.getParameter("tarjeta");
        String cvv = request.getParameter("cvv");
        String fechaExp = request.getParameter("fechaExp");

        // Validar que ningún dato sea nulo o vacío
        if (tarjeta == null || tarjeta.isEmpty() ||
            cvv == null || cvv.isEmpty() ||
            fechaExp == null || fechaExp.isEmpty()) {

            request.setAttribute("error", "Error al procesar el pago: faltan datos.");
            request.getRequestDispatcher("jsp/pago.jsp").forward(request, response);
            return; // detener procesamiento
        }

        // El pago es exitoso siempre que los datos existan
        boolean pagoExitoso = ReservaDAO.actualizarEstadoReserva(reservaId, "pagada");

        if (pagoExitoso) {
            Reserva reserva = ReservaDAO.obtenerReservaPorId(reservaId);
            request.setAttribute("reserva", reserva);
            request.getRequestDispatcher("jsp/billete.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Error al procesar el pago");
            request.getRequestDispatcher("jsp/pago.jsp").forward(request, response);
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
