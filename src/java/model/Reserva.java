
package model;

import java.util.Date;

public class Reserva {
    private int id;
    private Vuelo vuelo;
    private int numPasajeros;
    private String estado; // reservada, pagada, cancelada
    private Date fechaReserva;

    public Reserva() {
    }

    public Reserva(int id, Vuelo vuelo, int numPasajeros, String estado, Date fechaReserva) {
        this.id = id;
        this.vuelo = vuelo;
        this.numPasajeros = numPasajeros;
        this.estado = estado;
        this.fechaReserva = fechaReserva;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public int getNumPasajeros() {
        return numPasajeros;
    }

    public void setNumPasajeros(int numPasajeros) {
        this.numPasajeros = numPasajeros;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }
}
