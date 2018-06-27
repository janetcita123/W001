package pe.egcc.app.dto;

public class DiagnosticoDto {

	String atd_id ;
	String ate_id ;
	String dia_id ;
	
	public DiagnosticoDto() {
		// TODO Auto-generated constructor stub
	}

	public DiagnosticoDto(String atd_id, String ate_id, String dia_id) {
		super();
		this.atd_id = atd_id;
		this.ate_id = ate_id;
		this.dia_id = dia_id;
	}

	public String getAtd_id() {
		return atd_id;
	}

	public void setAtd_id(String atd_id) {
		this.atd_id = atd_id;
	}

	public String getAte_id() {
		return ate_id;
	}

	public void setAte_id(String ate_id) {
		this.ate_id = ate_id;
	}

	public String getDia_id() {
		return dia_id;
	}

	public void setDia_id(String dia_id) {
		this.dia_id = dia_id;
	}
	
	
	
}
