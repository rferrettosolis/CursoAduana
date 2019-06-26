package cl.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.entities.Producto;
import cl.model.ServicioLocal;

/**
 * Servlet implementation class Controller
 */
@WebServlet(name = "control.do", urlPatterns = { "/control.do" })
public class Controller extends HttpServlet {
	
	@EJB
	private ServicioLocal servicio;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    
    
    protected void inicio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bt = request.getParameter("boton");
		
		if(bt.equals("guardar")){
			this.guardar(request, response);
		}
		
		if(bt.equals("eliminar")){
			this.eliminar(request, response);
		}
		

	}
    
    protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigoProducto = request.getParameter("codigoPro");
		servicio.eliminrProducto(Long.valueOf(codigoProducto).longValue());
		response.sendRedirect("index.jsp");
	}
    
    
    
    protected void guardar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String precio = request.getParameter("precio");
		String stock = request.getParameter("stock");

		
		Producto producto = new Producto();
		producto.setNombre(nombre);
		producto.setPrecio(Integer.valueOf(precio));
		producto.setStock(Integer.valueOf(stock));
		
		
		
		servicio.agregarProducto(producto);
		
		response.sendRedirect("index.jsp");
	
	}
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.inicio(request, response);
	}

}
