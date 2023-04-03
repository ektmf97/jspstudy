package common;

public class ActionForward {

	private String path;       // 응답 경로(Jsp 이름)
	private boolean isRediret; // 이동 방식(true이면 redirect, false이면 forward)
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRediret() {
		return isRediret;
	}
	public void setRediret(boolean isRediret) {
		this.isRediret = isRediret;
	}
	
	
}
