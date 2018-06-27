package pe.egcc.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import pe.egcc.app.dto.AfiliadoDto;
import pe.egcc.app.dto.AtencionDto;
import pe.egcc.app.dto.ClienteDto;
import pe.egcc.app.dto.DiagnosticoDto;
import pe.egcc.app.dto.ProcedimientoDto;
import pe.egcc.app.dto.UsuarioDto;

@Service
public class EurekaService extends AbstractDaoSupport {

	public double getSaldoCuenta(String cuenta) {

		Double saldo = 0.0;
		try {
			String sql = "SELECT DEC_CUENSALDO FROM CUENTA WHERE CHR_CUENCODIGO = ?";
			Object[] param = { cuenta };
			saldo = jdbcTemplate.queryForObject(sql, param, Double.class);
		} catch (EmptyResultDataAccessException e) {
		}	
		return saldo;
		
	}
	
 
	public List<Map<String,Object>> getMovimientos(String cuenta){
		List<Map<String,Object>> lista;
		String sql= "select SUCUCODIGO, SUCUNOMBRE, CLIECODIGO, "
			+ "CLIEPATERNO, CLIEMATERNO, CLIENOMBRE,CUENCODIGO, "
			+ "CUENSALDO, CUENESTADO, MOVINUMERO, MOVIFECHA, "
			+ "MOVIIMPORTE, CUENREFERENCIA, TIPOCODIGO, TIPONOMBRE,"
			+ "TIPOACCION, MONECODIGO, MONENOMBRE "
			+ "FROM V_MOVIMIENTO WHERE CUENCODIGO = ? ";
		lista = jdbcTemplate.queryForList(sql, cuenta);
		return lista;
				
	}
	

	public UsuarioDto getusuario (String usuario, String pass){
		UsuarioDto rec = null;
		try{
			String sql = "SELECT "
					+ "USERNAME username, "
					+ "USER_ROLE rol, "
					+ "ESTADO estado, "
					+ "NOMBRES nombres, "
					+ "APELLIDOS apellidos "
					+ "from W_PRO_LOGUEO "
					+ "WHERE USERNAME=? and PASSWORD=?   ";
		rec = jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<UsuarioDto>(UsuarioDto.class ), new Object[] { usuario, pass });
			
		}catch (Exception e) {
			rec = null;
		}
		
		return rec;
	}
	
 
	 
	public List<Map<String,Object>> buscarAfiliado (String dni){
		List<Map<String,Object>> lista;
		try{
			String sql = "SELECT "
					+ "AFI_ID		   ide	    , "
					+ "AFI_NOMBRES    nombres   , "
					+ "AFI_APEPATERNO apepaterno, "
					+ "AFI_APEMATERNO apematerno, "
					+ "AFI_ESTADO     estado    , "
					+ "AFI_FECNAC     fecnac    , "
					+ "AFI_EDAD       edad      , "
					+ "AFI_SEXO       sexo      , "
					+ "AFI_TELEFONO   telefono  , "
					+ "AFI_DNI        dni   "
					+ "FROM PRO_AFILIADO     "
					+ "WHERE AFI_DNI=?  "; 
			lista = jdbcTemplate.queryForList(sql,  new Object[] {dni});
	 
		 System.out.println(lista);
		}catch (Exception e) {
			lista = null;
		}
		
		return lista;
	}
	
	public List<Map<String,Object>> guardarAtencion (AtencionDto ate, DiagnosticoDto dia, ProcedimientoDto pro){
		List<Map<String,Object>> lista = null;
		String num = "";
		try{
			String sql = "SELECT "
					+ "IDE_NOMBRE_TABLA  id_tb	    , "
					+ "IDE_NUM    num    "					 
					+ "FROM PRO_IDENTITY_TABLAS     "
					+ "WHERE IDE_NOMBRE_TABLA=?  "
				    + "for update ";
			
			Object[] param = { "PRO_ATENCION" };
			num = jdbcTemplate.queryForObject(sql, param, String.class);
		 
	 
		
		}catch (Exception e) {
			lista = null;
		}
		
		return lista;
	}
  
}
