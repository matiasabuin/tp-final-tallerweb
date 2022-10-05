package ar.edu.unlam.tallerweb1.delivery;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ar.edu.unlam.tallerweb1.domain.pedidos.Pelicula;
import ar.edu.unlam.tallerweb1.domain.pedidos.Videojuego;
import ar.edu.unlam.tallerweb1.domain.usuarios.ServicioPelicula;
import ar.edu.unlam.tallerweb1.domain.usuarios.ServicioVideojuego;

@Controller
public class ControladorRecomendaciones {

	private ServicioVideojuego servicioVideojuego;
	private ServicioPelicula servicioPelicula;

	@Autowired
	public ControladorRecomendaciones(ServicioVideojuego servicioVideojuego, ServicioPelicula servicioPelicula) {
		this.servicioVideojuego = servicioVideojuego;
		this.servicioPelicula = servicioPelicula;
	}
	
	@RequestMapping(path = "/recomendaciones", method = RequestMethod.GET)
	public ModelAndView irARecomendaciones(HttpServletRequest request) {
		
		ModelMap model = new ModelMap();

		List<Videojuego> videojuegosRegistrados = servicioVideojuego.obtenerTodosLosVideojuegos();
		List<Pelicula> peliculasRegistradas = servicioPelicula.obtenerTodasLasPeliculas();
		
		request.getSession().setAttribute("peliculas", peliculasRegistradas);

		request.getSession().setAttribute("videojuegos", videojuegosRegistrados);

		model.addAttribute("peliculas", peliculasRegistradas);
		model.addAttribute("videojuegos", videojuegosRegistrados);
		
		model.addAttribute("videojuegosRecomendados", request.getSession().getAttribute("videojuegosRecomendados"));
		model.addAttribute("peliculasRecomendadas", request.getSession().getAttribute("peliculasRecomendadas"));
		
		return new ModelAndView("recomendaciones", model);
	}

	@RequestMapping(path = "/buscar-recomendaciones", method = RequestMethod.GET)
	public ModelAndView buscarRecomendaciones(@RequestParam("horas") Integer horas,
			HttpServletRequest request) {
		
		List<Videojuego> videojuegosRecomendados = servicioVideojuego.obtenerVideojuegoPorTiempo(horas);
		
		List<Pelicula> peliculasRecomendadas = servicioPelicula.obtenerPeliculaPorTiempo(horas);
		
		request.getSession().setAttribute("peliculasRecomendadas", peliculasRecomendadas);
			
		request.getSession().setAttribute("videojuegosRecomendados", videojuegosRecomendados);

		return irARecomendaciones(request);

	}
	
}