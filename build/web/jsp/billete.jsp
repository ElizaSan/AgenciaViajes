<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Reserva" %>
<%@ page import="model.Vuelo" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Boleto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body>
    <header>
        <h1>Gracias por comprar en agencia de viajes SUPERSONICOS!</h1><br>
        <nav>
            <ul>
                <li><a href="#mexivuelos">Mexivuelos</a></li>
                <li><a href="#internationalfly">InternationalFly</a></li>
                <li><a href="#titanes">Titanes del Atlántico</a></li>
            </ul>
        </nav>
    </header>

    <article>
        <section>
            <%
                Reserva reserva = (Reserva) request.getAttribute("reserva");
                if (reserva == null) {
            %>
                <p>No se encontró la reserva.</p>
            <%
                } else {
                    Vuelo vuelo = reserva.getVuelo();
            %>
                <h2>Estos son los datos de tu boleto:</h2>
                <p><strong>Aerolínea:</strong> <%= vuelo.getAerolinea() %></p>
                <p><strong>Vuelo:</strong> <%= vuelo.getCodigoVuelo() %></p>
                <p><strong>Fecha:</strong> <%= vuelo.getFecha() %></p>
                <p><strong>Número de pasajeros:</strong> <%= reserva.getNumPasajeros() %></p>
                <p><strong>Estado de tu reserva:</strong> <%= reserva.getEstado() %></p>
                <p><strong>Precio total:</strong> $<%= vuelo.getPrecio().multiply(new java.math.BigDecimal(reserva.getNumPasajeros())) %></p>
            <%
                }
            %>
            <p><a href="${pageContext.request.contextPath}/index.jsp">Volver al menú principal</a></p>
        </section>
    </article>

    <footer>
        <p>© 2025 Agencia de Viajes SUPERSONICOS</p>
    </footer>
</body>
</html>
