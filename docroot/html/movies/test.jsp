<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <%@ taglib prefix="tf" uri="/WEB-INF/classes/taglib/tabligUmb.tld"%> --%>
<%@ taglib uri="customTag" prefix="ct" %>

<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="taglib.TagLibBean"/>
<ct:today format="MMMM dd, yyyy"/>

</body>
</html>