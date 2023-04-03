<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
		
		String item = request.getParameter("item");
		int itemCount = Integer.parseInt(request.getParameter("item_count"));
		
		// 제품명 + 구매수량을 하나의 Map으로 저장한다.
		Map<String, Object> map = new HashMap<>();
		map.put("item", item);
		map.put("itemCount", itemCount);
		
		/*  참고
		class Product {
			String item;
			int itemCount;
			Product(String item, int itemCount(){
				this.item = item;
				tihs.itemCount = itemCount;
			}
		}
		Product product = new Product(item, itemCount);
		 */
		
		 // session에 저장된 cart 속성이 있는지 확인한 뒤 없다면 새로운 cart를 만들어서 session에 저장한다.
		 List<Map<String, Object>> cart = (List<Map<String, Object>>)session.getAttribute("cart");
		 if(cart == null){
			 cart = new ArrayList<>(); 			 // 없으면 만들어라 
			 session.setAttribute("cart", cart); // 카트를 세션에 저장하기
		 }
		 
		 // session의 cart에 Map 저장하기 
		 cart.add(map);

	%>
	
	<script>
		if(confirm('<%=item%>을 장바구니에 추가했습니다. \n장바구니를 확인하려면 "확인", 계속 쇼핑하려면 "취소"버튼을 누르세요')){
			location.href = '03_cart_list.jsp'; // 확인 버튼을 누를 경우
		} else {
			location.href= '01_form.jsp'; // form 으로 다시 돌아가기
		}
	</script>
</body>
</html>