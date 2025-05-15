<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Vuelo" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vuelos disponibles</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>

<body>
    <header>
        <h1>Vuelos disponibles</h1>
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
            <h3>borrar esto: vuelos.jsp</h3>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>Aerolínea</th>
                    <th>Vuelo</th>
                    <th>Fecha</th>
                    <th>Precio</th>
                    <th>Seleccionar</th>
                </tr>
                <%
                    List<Vuelo> vuelos = (List<Vuelo>) request.getAttribute("vuelos");                 
                    Integer numPasajerosObj = (Integer) request.getAttribute("numPasajeros");
                    int numPasajeros = 1;
                    if (numPasajerosObj != null) {
                        numPasajeros = numPasajerosObj;
                    }
                %>
                <%    
                    if (vuelos != null && !vuelos.isEmpty()) {
                        for (Vuelo vuelo : vuelos) {
                %>
                <tr>
                    <td><%= vuelo.getAerolinea() %></td>
                    <td><%= vuelo.getCodigoVuelo() %></td>
                    <td><%= vuelo.getFecha() %></td>
                    <td>$<%= vuelo.getPrecio() %></td>
                    <td>
                        <form action="SeleccionVueloServlet" method="post">
                            <input type="hidden" name="vueloId" value="<%= vuelo.getId() %>" />
                            <input type="hidden" name="numPasajeros" value="<%= numPasajeros %>" />           
                            <input type="submit" value="Seleccionar" />
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No hay vuelos disponibles para la fecha seleccionada.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </section>
    </article>

    <aside>
        <p><a href="${pageContext.request.contextPath}/jsp/index.jsp">Volver al menú principal</a></p>
    </aside>

    <footer>
        <p>© 2025 Agencia de Viajes SUPERSONICOS</p>
    </footer>
</body>
</html>
