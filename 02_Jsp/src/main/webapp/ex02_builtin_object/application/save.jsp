<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String createdDate = request.getParameter("created_date");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 작성 IP
		String ip = request.getRemoteAddr();
		
		// real path
		// String realPath = request.getServletContext().getRealPath("storage")
		String realPath = application.getRealPath("storage");
		
		// 디렉터리 
		File dir = new File(realPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		
		/*
			IPv4 : 127.0.0.1       => 127_0_0_1
			IPv6 : 0:0:0:0:0:0:0:1 => 0_0_0_0_0_0_1
			아이피에 마침표불가해서 일관적으로 _ 표시로 바꿔서 사용 
		*/
		
		// 파일명 :  작성IP_작성일.txt
		String filename = ip.replace('.', '_').replace(':', '_') + createdDate.replace("-", "") + ".txt";
			
		// 작성된 아이피에 . 을 _ 로 바꿔라 : 도 _ 로 바꿔라 (-)이 들어있어서 없애는 작업  작은 따옴표 , 큰 따옴표 둘다 허용 
		// String filename = ip.replaceAll("[.:]","-") +"_'" +createdDate.replace("-", "") + ".txt";  정규식 
			
		// 파일 객체
		File file = new File(dir, filename);
		
		// 문자 파일 출력 스트림 생성
		BufferedWriter bw = new BufferedWriter(new FileWriter(file));
		
		// 파일 생성
		bw.write("작성일자 : " + createdDate);
		bw.newLine(); // 줄 바꿈
		bw.write("작성자 : " + writer);
		bw.newLine();
		bw.write("제목 : " + title);
		bw.newLine();
		bw.write("내용");
		bw.newLine();
		bw.write(content);
		bw.flush();
		bw.close();
	
	%>
	
	<script>
		
		var isCreated = <%=file.exists()%>; // var isCreated = false;  var isCreated = true;
		if(isCreated){
			alert('<%=filename%> 파일이 생성되었습니다.');
			location.href = '<%=request.getContextPath()%>/ex02_builtin_object/application/write_form.jsp';
		} else {
			alert('<%=filename%> 파일이 생성되지 않았습니다.');
			history.back(); // 작성한 내용이 남아있다.
		}
	</script>
	
	
</body>
</html>