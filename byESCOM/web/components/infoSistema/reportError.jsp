<%-- 
    Document   : reportError
    Created on : 19/11/2018, 02:47:12 PM
    Author     : MedinaVilla
--%>

<%@page contentType="text/html" import="Java.*" pageEncoding="UTF-8"%>
<%HttpSession sesion = request.getSession();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="./css/bulma.css" type="text/css">
        <link rel="stylesheet" href="./fonts/css/all.css"> 
             <script src="./js/reportError.js"></script>
        <title>Reportar Error</title>
    </head>
    <body>
        <%
            navbar navbar = new navbar();
            try {
                out.println(navbar.showNavbar(sesion.getAttribute("nombreUsuario").toString(), sesion.getAttribute("tipoUsuario").toString()));
            } catch (Exception e) {
                out.println(navbar.showNavbar("", ""));
            }
        %>
        <section class="hero is-primary">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        Reportar error
                </div>
            </div>
        </section>
        <div class="box has-text-centered">Nos gustaría que nos comunique errores que haya encontrado en la plataforma para solucionarlo lo antes posible.</div>
        <br/>
        <div class="columns">
            <div class="column is-one-quarter">
            </div>
            <div class="column is-half">
                <div class="box">
                    <form name="reportError" action="./enviarReporte" onsubmit="return validarReportError()">
                        <div class="field">
                            <label class="label">¿En qué submódulo encontraste el error?</label>
                            <div class="control has-icons-left">
                                <div class="control">
                                    <input type="text" class="input is-primary" id="submodulo" name="submodulo"/>
                                </div>
                                <p id="sbErr" class="help is-danger"> </p>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">¿Podrías explicarnos el error que has encontrado?</label>
                            <div class="control has-icons-left">
                                <div class="control">
                                   <input type="textarea" class="textarea is-primary" id="explicacion" name="explicacion" />
                                </div>
                                <p id="exErr" class="help is-danger"> </p>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">¿Nos puedes describir cómo encontraste el error?</label>
                            <div class="control has-icons-left">
                                <div class="control">
                                    <input type="textarea" class="textarea is-primary" id="metodo" name="metodo" />
                                </div>
                                <p id="metErr" class="help is-danger"> </p>
                            </div>
                        </div><br/>
                         <div class="field is-grouped">
                            <div class="control">
                                <button class="button is-primary">Enviar reporte</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="column is-one-quarter">
                </div>
            </div>
        </div>
    </body>
    <%
        footer footer = new footer();
        out.println(footer.showFooter());
    %>
</html>
