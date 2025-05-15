package model;

import utils.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VueloDAO {
    public static List<Vuelo> buscarVuelosDisponibles(String fecha, int numPasajeros) {
        List<Vuelo> vuelos = new ArrayList<>();

        String sql = "SELECT * FROM Vuelos WHERE fecha = ? AND plazas_disponibles >= ?";

        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setDate(1, Date.valueOf(fecha));
            ps.setInt(2, numPasajeros);
 
            ResultSet rs = ps.executeQuery();
 

            while (rs.next()) {
                Vuelo vuelo = new Vuelo();
                vuelo.setId(rs.getInt("id"));
                vuelo.setAerolinea(rs.getString("aerolinea"));
                vuelo.setCodigoVuelo(rs.getString("codigo_vuelo"));
                vuelo.setFecha(rs.getDate("fecha"));
                vuelo.setPlazasTotales(rs.getInt("plazas_totales"));
                vuelo.setPlazasDisponibles(rs.getInt("plazas_disponibles"));
                vuelo.setPrecio(rs.getBigDecimal("precio"));

                vuelos.add(vuelo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vuelos;
    }
}

