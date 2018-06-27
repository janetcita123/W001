package pe.egcc.app.dto;

import java.util.Date;
 

public class AfiliadoDto {
	private int ide;
	private String nombres    ;
	private String apepaterno ;
	private String apematerno ;
	private String estado     ;
	private Date fecnac     ;
	private String edad       ;
	private String sexo       ;
	private String telefono   ;
	private String dni        ;
	
	public AfiliadoDto() {
		// TODO Auto-generated constructor stub
	}

	public AfiliadoDto(int ide, String nombres, String apepaterno, String apematerno, String estado, Date fecnac,
			String edad, String sexo, String telefono, String dni) {
		super();
		this.ide = ide;
		this.nombres = nombres;
		this.apepaterno = apepaterno;
		this.apematerno = apematerno;
		this.estado = estado;
		this.fecnac = fecnac;
		this.edad = edad;
		this.sexo = sexo;
		this.telefono = telefono;
		this.dni = dni;
	}

	public int getIde() {
		return ide;
	}

	public void setIde(int ide) {
		this.ide = ide;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApepaterno() {
		return apepaterno;
	}

	public void setApepaterno(String apepaterno) {
		this.apepaterno = apepaterno;
	}

	public String getApematerno() {
		return apematerno;
	}

	public void setApematerno(String apematerno) {
		this.apematerno = apematerno;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Date getFecnac() {
		return fecnac;
	}

	public void setFecnac(Date fecnac) {
		this.fecnac = fecnac;
	}

	public String getEdad() {
		return edad;
	}

	public void setEdad(String edad) {
		this.edad = edad;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

		
}
