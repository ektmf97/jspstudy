<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="str" value="Hello World" scope="page" />
	
	<h3>${fn:length(str)}</h3>
	
	<%-- ${fn:substring(value 값 , 시작 인덱스, 종료 인덱스)} --%>
	<h3>${fn:substring(str, 0, 5)}</h3>
	<h3>${fn:substringBefore(str, ' ')}</h3> <%-- 공백문자 전까지 --%>
	<h3>${fn:substringAfter(str, ' ')}</h3> <%-- 공백문자 후까지 --%>
	
	<h3>${fn:indexOf(str, 'l')}</h3>
	<h3>${fn:replace(str, 'l', 'z')}</h3> <%-- l을 찾아서 z로 바꿔라  --%>
	
	<%-- value가 중요 사용자가 자바스크립트 아는 경우 --%>
	<%-- 막아줘야 한다. 프로젝트 할 때 털리기 쉬움  --%>
	<c:set var="str2" value="<script>location.href='/';</script>" />
	<h3>${fn:escapeXml(str2)}</h3>
	
	<c:if test="${fn:startsWith(str, 'Hello')}">
		<h3>Hello로 시작한다.</h3>
	</c:if>
	<c:if test="${fn:endsWith(str, 'World')}">
		<h3>World로 끝난다.</h3>
	</c:if>
	<c:if test="${fn:contains(str, 'h')}">
		<h3>h를 포함한다.</h3>
	</c:if>
	<%-- 대 소문자 무시 --%>
	<c:if test="${fn:containsIgnoreCase(str, 'h')}">
		<h3>H, h를 포함한다.</h3>
	</c:if>
	
	<c:set var="str3" value="a,b,c,d,e,f,g,h,i,j,k" scope="page" />
	<c:set var="items" value="${fn:split(str3, ',')}" scope="page"/>
	<%-- 배열 확인법 --%>
	<c:forEach var="item" items="${items}" varStatus="vs">
		<div>${vs.index} - ${item}</div>
	</c:forEach>
	
	<c:set var="str4" value="${fn:join(items, ',')}" scope="page" />
	<h3>${str4}</h3>
	
</body>
</html>