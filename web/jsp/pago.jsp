<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pago de vuelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles_pago.css" />
    <script src="js/confirmar.js" defer></script>
</head>
<body>
    <header>
        <h1>Ya casi es tuyo!</h1>
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
            <h2>Completa el formulario de Pago</h2>
            <form action="PagoServlet" method="post" onsubmit="return confirmarPago();">
                <input type="hidden" name="reservaId" value="${reservaId}" />

                <label for="tarjeta">Número de tarjeta:</label>
                <input type="text" id="tarjeta" name="tarjeta" maxlength="16" required /><br/>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" maxlength="3" required /><br/>

                <label for="fechaExp">Fecha de expiración:</label>
                <input type="text" id="fechaExp" name="fechaExp" required /><br/>

                <input type="submit" value="Pagar" />
            </form>
            <p><a href="${pageContext.request.contextPath}/index.jsp">Volver al menú principal</a></p>
        </section>
    </article>

    <footer>
        <p>© 2025 Agencia de Viajes SUPERSONICOS</p>
    </footer>
</body>
</html>
