<%-- 
    Document   : enviarReporteError
    Created on : 21/11/2018, 11:23:45 AM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" import="Java.*" pageEncoding="UTF-8"%>
<%
    database bd = new database();
    bd.conectar();
    
    request.setCharacterEncoding("UTF-8");
            
    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
    boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
    
    if(verify){
        ResultSet rs;
        String submodulo = request.getParameter("submodulo");
        String explicacion = request.getParameter("explicacion");
        String metodo = request.getParameter("metodo");
        errores reporteError = new errores();

        try {
            reporteError.registrarReporte(submodulo, explicacion, metodo);
            request.getSession().setAttribute("repSend", "EnvioExitoso");
            response.sendRedirect("./reportarError");
        } catch (SQLException e) {
            out.println(e.toString());
            response.sendRedirect("./reportarError");
        }
        
    }else{
        request.getSession().setAttribute("repSend", "Bot");
        response.sendRedirect("./reportarError");
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loading</title>
    </head>
    <body>
        <h1>Reporte men!</h1>
    </body>
</html>
