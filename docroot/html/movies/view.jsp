<%@page import="com.omertron.themoviedbapi.model.movie.MovieInfo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page isELIgnored="false" %>
<portlet:defineObjects />
<%
	List<MovieInfo> listMovies = (List<MovieInfo>)renderRequest.getAttribute("top20movies"); 
	String url = (String)renderRequest.getAttribute("url");
	String url_href = url.replace("/w154", "/original");
	System.out.println("url--------------->"+url);
	System.out.println("url_href--------------->"+url_href);
%>
<%-- Umberto: setto la variabile altrimenti non sarebbe vista da JSTP --%>
<c:set var="url_href" scope="session" value="<%=url_href%>"/>
<!-- <div><label class="top_message_list">Nuovi film</label><br/> -->
<%-- <c:out value="${newsMovies.title}"></c:out> --%>
<!-- </div> -->
<div id="top_message_list" class="top_message_list">TOP <b>20 Film</b></div> 
<br/>
<div id="movieList">
<ul>
<jsp:useBean id="Movies" class="com.omertron.themoviedbapi.model.movie.MovieInfo"/>

<c:forEach var="movie" items="${top20movies}">
            <li>
	            <a href="<c:out value="${url_href}${movie.posterPath}"/>" target="_blank"><c:out value="${movie.title}"/><br/>
	            	<img src="<c:out value="${url}${movie.posterPath}"/>" alt="<c:out value="${movie.title}"/>" />
	            </a>
	       </li>
</c:forEach>

<%-- <% for (MovieInfo movie : listMovies) { %> --%>
<%-- <li><%= movie.getOriginalTitle() %><br/> --%>
<!-- <div id="imageFilm"> -->
<%-- <img alt="" src="<%=url+movie.getPosterPath()%>"> --%>
<%-- <label title="Descrizione"><%=movie.getOverview() %></label> --%>
<!-- </div> -->
<!-- </li> -->
<%-- <%  } %> --%>
</ul>
</div>