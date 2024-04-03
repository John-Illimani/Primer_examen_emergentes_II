
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Estudiante"%>
<%

    
    if (session.getAttribute("listaEst") == null) {
        ArrayList<Estudiante> lisAux = new ArrayList<Estudiante>();
        session.setAttribute("listaEst", lisAux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) session.getAttribute("listaEst");
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

        <div style="text-align: center;" >

        </div>

        <div style="padding-left: 29px; ">

            <form action="MainServlet" method="get" style="display: inline;">
                <input type="hidden" name="op" value="nuevo">
                <button type="submit">Nuevo</button>
            </form>

            
        </div>
        <br>


        <table border="1" style="width: 95%; margin: 0 auto; text-align: center;" cellspacing="0">
            <tr style="background: yellow">

                <th>Id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>P3(40)</th>
                <th>Nota</th>
                <th></th>
                <th></th>
            </tr>

            <%
                if (lista != null) {
                    for (Estudiante item : lista) {
                        int suma_de_notas = item.getP1() + item.getP2() + item.getP3();

            %>


            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getNombre()%></td>
                <td><%=item.getP1()%></td>
                <td><%=item.getP2()%></td>
                <td><%=item.getP3()%></td>
                <td><%=suma_de_notas%></td>

                <td><a href="MainServlet?op=editar&id=<%=item.getId()%>">Editar</a></td>
                <td><a href="MainServlet?op=eliminar&id=<%=item.getId()%>"onclick="return(confirm('Seguro que desea eliminar al estudiante y sus calificaciones?'))"  
                       >Eliminar</a></td>


            </tr>
            <%
                    }
                }
            %>

        </table>
    </div>


</body>
</html>
