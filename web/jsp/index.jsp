
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
                            <input type="date" id="fecha" name="fecha" required/><br><br>

                            <label for="numPasajeros">Número de pasajeros:</label>
                            <input type="number" id="numPasajeros" name="numPasajeros" min="1" required />

                            <input type="submit" value="Buscar vuelos" />
                        </form>
                        
                    </section>
                    <section id="detalle-aerolineas">
                        <h2>Aerolíneas</h2>
                        <div id="mexivuelos">
                            <h3>Mexivuelos</h3>
                            <img src="${pageContext.request.contextPath}/images/mexivuelos-logo.png" alt="Logo Mexivuelos" />

                            <p>La mejor opción nacional para tus viajes.</p>
                            <ul>
                                <li>Salidas: CDMX</li>
                                <li>Destino: Guadalajara</li>
                            </ul>
                            <p>Mexivuelos es una aerolínea mexicana con más de 20 años de experiencia, reconocida por su compromiso con la seguridad y la calidad del servicio. Opera principalmente vuelos desde Ciudad de México hacia Guadalajara, conectando dos de las ciudades más importantes del país con atención personalizada y tarifas competitivas.<p>
                        </div>
                        
                        <div id="internationalfly">
                            <h3>InternationalFly</h3>
                            <img src="${pageContext.request.contextPath}/images/internationalfly-logo.jpg" alt="Logo InternationalFly" />
                            <ul>
                                <li>Salidas: Barcelona</li>
                                <li>Destino: Costa Rica</li>
                            </ul>
                            
                            <p>Viajes internacionales con comodidad y seguridad.</p>
                            <p>InternationalFly es una aerolínea global que desde su fundación ha destacado por su innovación tecnológica y servicio al cliente. Sus vuelos emblemáticos conectan Barcelona con Costa Rica, ofreciendo comodidad y eficiencia a viajeros tanto de negocios como de turismo con modernas flotas y opciones flexibles.</p>
                        </div>
                        
                        <div id="titanes">
                            <h3>Titanes del Atlántico</h3>
                            <img src="${pageContext.request.contextPath}/images/titanes-logo.jpg" alt="Logo Titanes del Atlántico" />
                            <p>Tu conexión con el Atlántico y más allá.</p>
                            <ul>
                                <li>Salidas: Islandia</li>
                                <li>Destino: Noruega</li>
                            </ul>
                            
                        <p>Titanes del Atlántico se ha consolidado como una de las aerolíneas líderes en vuelos transatlánticos, combinando tradición y modernidad. Su ruta principal enlaza Islandia con Noruega, brindando una experiencia a bordo de excelencia, puntualidad y un fuerte compromiso con la sustentabilidad y responsabilidad social.</p>
                        </div>
                    </section>
                </article>

                <aside>
                    <h3>Información adicional</h3>
                    <p>Promociones especiales y recomendaciones para viajeros.</p>
                    <p>Promociones especiales y recomendaciones para viajeros.</p>
                    <ul>
                      <li>Descuentos de hasta 20% en vuelos con niños.</li>
                      <li>Equipaje extra gratuito para reservas anticipadas.</li>
                      <li>Asistencia personalizada 24/7 durante tu viaje.</li>
                      <li>Viaja seguro y cómodo en temporada alta.</li>
                    </ul>

                    
                </aside>
            </main>

            <footer>
                <p>© 2025 Agencia de Viajes SUPERSONICOS</p>
            </footer>
    </body>
</html>
