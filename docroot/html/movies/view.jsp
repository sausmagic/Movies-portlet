<%@page import="com.omertron.themoviedbapi.TheMovieDbApi"%>
<%@page import="com.omertron.themoviedbapi.model.movie.MovieInfo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="customTag" prefix="ct" %>
<%@ page isELIgnored="false" %>
<portlet:defineObjects />
<%
TheMovieDbApi mdb = (TheMovieDbApi)renderRequest.getAttribute("mdb");
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
<div id="movieList" class="table_top_20_list">
<table>


<!-- <ul> -->
<jsp:useBean id="Movies" class="com.omertron.themoviedbapi.model.movie.MovieInfo"/>
<jsp:useBean id="obj" class="taglib.TagLibBean"/>
<c:forEach var="movie" items="${top20movies}">
<!--             <li> -->
	            
	            	<tr>
	            		<td>
	            			<c:out value="${movie.title}"/>
	            		</td>
	            		<td>
<%-- 	            			<c:out value="${movie.}"></c:out> --%>
								<ct:today format="MMMM dd, yyyy"/>
<%-- 								${ct:testMethod(obj,"abc",123,true)} --%>
	            		</td>
	         
		            	<td>
			            	<a href="<c:out value="${url_href}${movie.posterPath}"/>" target="_blank">
			            		<img src="<c:out value="${url}${movie.posterPath}"/>" alt="<c:out value="${movie.title}"/>" />
			            	</a>
		            	</td>
	   	            </tr>
<!-- 	       </li> -->
</c:forEach>
</table>
<%-- <% for (MovieInfo movie : listMovies) { %> --%>
<%-- <li><%= movie.getOriginalTitle() %><br/> --%>
<!-- <div id="imageFilm"> -->
<%-- <img alt="" src="<%=url+movie.getPosterPath()%>"> --%>
<%-- <label title="Descrizione"><%=movie.getOverview() %></label> --%>
<!-- </div> -->
<!-- </li> -->
<%-- <%  } %> --%>
<!-- </ul> -->
</div>