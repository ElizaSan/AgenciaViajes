package model;

import java.sql.*;
import java.util.Date;
import utils.ConexionBD;

public class ReservaDAO {

    public static int crearReserva(int vueloId, int numPasajeros) {
        Connection con = null;
        PreparedStatement psReserva = null;
        PreparedStatement psUpdateVuelo = null;
        ResultSet generatedKeys = null;

        try {
            con = ConexionBD.getConnection();
            con.setAutoCommit(false);

            String sqlReserva = "INSERT INTO Reservas (vuelo_id, num_pasajeros, estado, fecha_reserva) VALUES (?, ?, 'reservada', NOW())";
            psReserva = con.prepareStatement(sqlReserva, Statement.RETURN_GENERATED_KEYS);
            psReserva.setInt(1, vueloId);
            psReserva.setInt(2, numPasajeros);

            int res = psReserva.executeUpdate();

            if (res == 0) {
                con.rollback();
                return -1;
            }

            generatedKeys = psReserva.getGeneratedKeys();
            int reservaId;
            if (generatedKeys.next()) {
                reservaId = generatedKeys.getInt(1);
            } else {
                con.rollback();
                return -1;
            }

            // Actualizar plazas disponibles
            String sqlUpdate = "UPDATE Vuelos SET plazas_disponibles = plazas_disponibles - ? WHERE id = ? AND plazas_disponibles >= ?";
            psUpdateVuelo = con.prepareStatement(sqlUpdate);
            psUpdateVuelo.setInt(1, numPasajeros);
            psUpdateVuelo.setInt(2, vueloId);
            psUpdateVuelo.setInt(3, numPasajeros);

            int updateRes = psUpdateVuelo.executeUpdate();

            if (updateRes == 0) {
                con.rollback();
                return -1;
            }

            con.commit();
            return reservaId;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (con != null) con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return -1;
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (psReserva != null) psReserva.close();
                if (psUpdateVuelo != null) psUpdateVuelo.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



    public static boolean actualizarEstadoReserva(int reservaId, String nuevoEstado) {
        String sql = "UPDATE Reservas SET estado = ? WHERE id = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nuevoEstado);
            ps.setInt(2, reservaId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Reserva obtenerReservaPorId(int reservaId) {
        Reserva reserva = null;
        String sql = "SELECT r.id, r.num_pasajeros, r.estado, v.aerolinea, v.codigo_vuelo, v.fecha, v.precio " +
                     "FROM Reservas r JOIN Vuelos v ON r.vuelo_id = v.id WHERE r.id = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, reservaId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                reserva = new Reserva();
                reserva.setId(rs.getInt("id"));
                reserva.setNumPasajeros(rs.getInt("num_pasajeros"));
                reserva.setEstado(rs.getString("estado"));
                // Puedes crear un objeto Vuelo y setearlo en reserva si lo defines así
                Vuelo vuelo = new Vuelo();
                vuelo.setAerolinea(rs.getString("aerolinea"));
                vuelo.setCodigoVuelo(rs.getString("codigo_vuelo"));
                vuelo.setFecha(rs.getDate("fecha"));
                vuelo.setPrecio(rs.getBigDecimal("precio"));
                reserva.setVuelo(vuelo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reserva;
    }
  
}
