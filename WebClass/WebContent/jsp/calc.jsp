<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숫자 합 계산</title>
</head>
<body>
	<form>
		<input type="number" name="num" min=1 required>
		<button type="submit">계산</button>
	</form>
	<%-- 스크립틀릿 tag로 1~입력받은 숫자까지의 합 구하기 --%>
	<%-- 결과 출력 시 변수 값은 표현식 tag로 작성하기 (jsp 파일 로딩시에는 보이지 않음) --%>
	<%
	String num = null, output = null;
	num = request.getParameter("num");
	if(num != null){
		try{
			int input = Integer.parseInt(num);
			output = Integer.toString(input*(input+1)/2);
%>
	<h1>
		1 ~
		<%=num%>까지의 합은
		<%=output%>입니다.
	</h1>
	<%
		}
		catch (NumberFormatException e) {
			
		}
	}
%>
</body>
</html>