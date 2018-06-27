package pe.egcc.app.dto;

public class ProcedimientoDto {

	String ate_id ;
	String atp_id ;
	String pro_id ;
	
	public ProcedimientoDto() {
		// TODO Auto-generated constructor stub
	}

	public ProcedimientoDto(String ate_id, String atp_id, String pro_id) {
		super();
		this.ate_id = ate_id;
		this.atp_id = atp_id;
		this.pro_id = pro_id;
	}

	public String getAte_id() {
		return ate_id;
	}

	public void setAte_id(String ate_id) {
		this.ate_id = ate_id;
	}

	public String getAtp_id() {
		return atp_id;
	}

	public void setAtp_id(String atp_id) {
		this.atp_id = atp_id;
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	
	
}
