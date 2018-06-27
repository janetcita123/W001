package pe.egcc.app.controller;

import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map; 

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import pe.egcc.app.dto.AfiliadoDto;
import pe.egcc.app.dto.ClienteDto;
import pe.egcc.app.dto.UsuarioDto; 
import pe.egcc.app.service.EurekaService;


@Controller
public class HomeController {
	
	@Autowired
	private EurekaService eurekaService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
 
	
	 
	 
	
	@RequestMapping(value="/traerMovimientos", method = RequestMethod.GET)
	@ResponseBody
	public String traerMovimientos(String cuenta){
		
		List<Map<String,Object>> lista;
		lista= eurekaService.getMovimientos(cuenta);
		Gson gson = new Gson();		
		return gson.toJson(lista);
				
	}
	
	@RequestMapping(value="/getMovimientos", method = RequestMethod.GET)
	public String getMovimientos(){			 
		
		return "getMovimientos";
				
	}
	
	 
 
	 @RequestMapping(value = "/getloguin")
		public String procesarLogin( String usuario, String pass, HttpSession session){
		 UsuarioDto rec=null; 
				 rec=eurekaService.getusuario(usuario, pass);
			session.setAttribute("usuario", rec);
			
			
			if(rec==null){
				session.invalidate();
				session.setAttribute("mensaje", "Usuario o password invalido");				 
				return "home";
			}
			return "getInicio";
		}
		

		@RequestMapping(value = "/cerrarSesion", method = RequestMethod.GET)
		public String procesarLogin(HttpSession session){

			session.invalidate();
			return "home";
			
		}
	 
		@RequestMapping(value="/getAtencion", method = RequestMethod.GET)
		public String getAtencion(){			 
			
			return "getInicio";
					
		}
	 
		 
		@RequestMapping(value="/traerAfiliado", method = RequestMethod.GET)
		@ResponseBody
			public String buscarAfiliado(String dni){
			List<Map<String,Object>> afiliado;
			afiliado =eurekaService.buscarAfiliado(dni);
		 	Gson gson = new Gson();		
			return gson.toJson(afiliado); 
			 
		}
			
		
	@RequestMapping(value="/getAfiliado", method = RequestMethod.GET)
		public String getAfiliado(){			 
			
			return "getAfiliado";
					
	}
		@RequestMapping(value="/getConsulta", method = RequestMethod.GET)
		public String getConsulta(){			 
			
			return "getConsulta";
					
		}
		@RequestMapping(value="/getCuenta", method = RequestMethod.GET)
		public String getCuenta(){			 
			
			return "getCuenta";
					
		}
		
		@RequestMapping(value="/guardaAtencion2", method = RequestMethod.GET)
		@ResponseBody		 
			public String guardaAtencion(String data){
			System.out.println(data);
		/*	List<Map<String,Object>> afiliado;
			afiliado =eurekaService.buscarAfiliado(informacion);*/
		 	Gson gson = new Gson(); 		
			return gson.toJson(data); 
			 
		}
		
		@RequestMapping(value = "/guardaAtencion", method = RequestMethod.POST)
			    public @ResponseBody String addPerson(@RequestBody String data) {
			
					return data;
		 
				
		  }


			
	
}
