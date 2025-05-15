package model;

import java.math.BigDecimal;
import java.util.Date;

public class Vuelo {
    private int id;
    private String aerolinea;
    private String codigoVuelo;
    private Date fecha;
    private int plazasTotales;
    private int plazasDisponibles;
    private BigDecimal precio;

    public Vuelo() {
    }

    public Vuelo(int id, String aerolinea, String codigoVuelo, Date fecha, int plazasTotales, int plazasDisponibles, BigDecimal precio) {
        this.id = id;
        this.aerolinea = aerolinea;
        this.codigoVuelo = codigoVuelo;
        this.fecha = fecha;
        this.plazasTotales = plazasTotales;
        this.plazasDisponibles = plazasDisponibles;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAerolinea() {
        return aerolinea;
    }

    public void setAerolinea(String aerolinea) {
        this.aerolinea = aerolinea;
    }

    public String getCodigoVuelo() {
        return codigoVuelo;
    }

    public void setCodigoVuelo(String codigoVuelo) {
        this.codigoVuelo = codigoVuelo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getPlazasTotales() {
        return plazasTotales;
    }

    public void setPlazasTotales(int plazasTotales) {
        this.plazasTotales = plazasTotales;
    }

    public int getPlazasDisponibles() {
        return plazasDisponibles;
    }

    public void setPlazasDisponibles(int plazasDisponibles) {
        this.plazasDisponibles = plazasDisponibles;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }
}
