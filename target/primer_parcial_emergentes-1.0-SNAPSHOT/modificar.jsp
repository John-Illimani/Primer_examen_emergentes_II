
<%@page import="com.emergentes.Estudiante"%>
<%
    Estudiante per = (Estudiante) request.getAttribute("miobjEst");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="datos.jsp" %>



        <div style="text-align: center;">

            <div style="display: inline-block; text-align: left;">

                <form action="MainServlet" method="post">
                    <fieldset style="width: 100%">

                        <table >
                            <tr style="display: none;">
                                <td>ID</td>
                                <td><input type="text" name="id" value="<%=per.getId()%>" placeholder="ID"></td>
                            </tr>

                            <tr>
                                <td>Nombre del estudiante: </td>
                                <td><input type="text" name="nombre" value="<%=per.getNombre() != null ? per.getNombre() : ""%>" placeholder="nombre"></td>
                            </tr>
                            <tr>
                                <td>Primer parcial (sobre 30 pts): </td>
                                <td><input type="number" name="P1" value="<%=per.getP1() != 0 ? per.getP1() : ""%>" placeholder="P1" size="2" max="30"></td>
                            </tr>
                            <tr>
                                <td>Segundo parcial (sobre 30 pts): </td>
                                <td><input type="number" name="P2" value="<%=per.getP2() != 0 ? per.getP2() : ""%>" placeholder="P2" size="2" max="30"></td>
                            </tr>
                            <tr>
                            <tr>
                                <td>Examen final(sobre 40 pts): </td>
                                <td><input type="number" name="P3" value="<%=per.getP3() != 0 ? per.getP3() : ""%>" placeholder="P3" size="2" max="40"></td>
                            </tr>


                        </table>

                    </fieldset>
                            <br>

                    <div style="text-align: center;">
                        <input type="submit" value="enviar">
                    </div>
                </form>
            </div>

        </div>


    </body>
</html>
