
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         
        String op = request.getParameter("op");
        
        Estudiante objEst = new Estudiante();
        int id, posicion;
        
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");
        
        switch (op) {
            case "nuevo":
                
                request.setAttribute("miobjEst", objEst);
                request.getRequestDispatcher("modificar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                
                posicion = buscaPorIndice(request, id);
                
                objEst = lista.get(posicion);
                
                request.setAttribute("miobjEst", objEst);
                request.getRequestDispatcher("modificar.jsp").forward(request, response);
                
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                posicion = buscaPorIndice(request, id);
                if (posicion >= 0) {
                    lista.remove(posicion);
                }
                request.setAttribute("listaEst", lista);
                
                response.sendRedirect("index.jsp");
                
                break;
            
            default:
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");
        
        Estudiante objEst = new Estudiante();
        objEst.setId(id);
        objEst.setNombre(request.getParameter("nombre"));
        objEst.setP1(Integer.parseInt(request.getParameter("P1")));
        objEst.setP2(Integer.parseInt(request.getParameter("P2")));
        objEst.setP3(Integer.parseInt(request.getParameter("P3")));
        
        if (id == 0) {
            
            int idNuevo = obtenerID(request);
            objEst.setId(idNuevo);
            lista.add(objEst);
        } else {
           
            int pos = buscaPorIndice(request, id);
            lista.set(pos, objEst);
            
        }
        request.setAttribute("listaEst", lista);
        response.sendRedirect("index.jsp");
        
    }
    
    
    
    
    
    public int buscaPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");
        
        int pos = -1;
        if (lista != null) {
            for (Estudiante ele : lista) {
                ++pos;
                if (ele.getId() == id) {
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerID(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");


        int idN = 0;
        
        for (Estudiante ele : lista) {
            idN = ele.getId();
        }
        
        return idN + 1;
        
    }


}
