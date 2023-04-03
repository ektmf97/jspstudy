package common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ActionForward {
	private String path; // 이동할 Jsp 경로(이름)
	private boolean isRedirect; // 이동방식 리다이렉트 유 무 (true이면 redirect, false이면 forward)  
}
