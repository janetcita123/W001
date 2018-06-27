package pe.egcc.app.dto;

public class UsuarioDto {

	private String username;
	private String rol;
	private String estado;
	private String nombres;
	private String apellidos;
	
	public UsuarioDto() {
		// TODO Auto-generated constructor stub
	}

	public UsuarioDto(String username, String rol, String estado, String nombres, String apellidos) {
		super();
		this.username = username;
		this.rol = rol;
		this.estado = estado;
		this.nombres = nombres;
		this.apellidos = apellidos;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

		
}
