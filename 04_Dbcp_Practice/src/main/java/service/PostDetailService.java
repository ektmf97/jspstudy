package service;

import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PostVO;
import repository.PostDAO;

public class PostDetailService implements IPostService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("post_no"));
		int post_no = Integer.parseInt(opt.orElse("0")); // null이면 0으로 바꿔서 꺼내줘라, 정수로 바꿔주는  Integer
		
		// 호출해서 받아오기 
		// 그 결과를 request에 저장시킴 
		PostVO post = PostDAO.getInstance().getPostByNo(post_no);
		
		if(post == null) {
			// 검색 된 결과가 없으면 
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않은 포스트입니다.')");
			out.println("history.back()"); // 존재하지 않으면 다시 돌아가라
			out.println("</script>");
			out.flush();
			out.close();
			return null; // 이미 응답이 되었으므로 컨트롤러로 이동할 경로를 반환하면 안 된다.
		} else {
			
			request.setAttribute("post", post);
			return "post/detail.jsp"; // 여기로 이동하자 
			// 게시글이 있다면 포스트컨트롤러에 if문 안에 path로 이동 , 그 후에 forward로 향하게 된다.
		}
		
	}

}
