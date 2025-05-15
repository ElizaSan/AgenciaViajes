
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agencia de viajes SUPERSONICOS</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />

    </head>
    <body>
        
        <header>
                <h1>Agencia de Viajes SUPERSONICOS</h1>
                <nav>
                    <ul>
                        <li><a href="#mexivuelos">Mexivuelos</a></li>
                        <li><a href="#internationalfly">InternationalFly</a></li>
                        <li><a href="#titanes">Titanes del Atlántico</a></li>
                    </ul>
                </nav>
            </header>

            <main>
                <article>
                    <section id="reserva">
                        <h2>Reserva tu vuelo</h2>
                        
                        <form action="ReservaServlet" method="post">
                            <label for="fecha">Fecha del vuelo:</label>
                            <input type="date" id="fecha" name="fecha" required />

                            <label for="numPasajeros">Número de pasajeros:</label>
                            <input type="number" id="numPasajeros" name="numPasajeros" min="1" required />

                            <input type="submit" value="Buscar vuelos" />
                        </form>
                        
                    </section>
                    <section id="detalle-aerolineas">
                        <h2>Aerolíneas</h2>
                        <div id="mexivuelos">
                            <h3>Mexivuelos</h3>
                            <img src="images/mexivuelos-logo.png" alt="Logo Mexivuelos" />
                            <p>La mejor opción nacional para tus viajes.</p>
                        </div>
                        <div id="internationalfly">
                            <h3>InternationalFly</h3>
                            <img src="images/internationalfly-logo.jpg" alt="Logo InternationalFly" />
                            <p>Viajes internacionales con comodidad y seguridad.</p>
                        </div>
                        <div id="titanes">
                            <h3>Titanes del Atlántico</h3>
                            <img src="images/titanes-logo.jpg" alt="Logo Titanes del Atlántico" />
                            <p>Tu conexión con el Atlántico y más allá.</p>
                        </div>
                    </section>
                </article>

                <aside>
                    <h3>Información adicional</h3>
                    <p>Promociones especiales y recomendaciones para viajeros.</p>
                </aside>
            </main>

            <footer>
                <p>© 2025 Agencia de Viajes</p>
            </footer>
    </body>
</html>
