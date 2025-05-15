
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
        <h1>Ya casi es tuyo!</h1>
        
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
        <p><a href="${pageContext.request.contextPath}/jsp/index.jsp">Volver al menú principal</a></p>
        
        
    </body>
</html>
