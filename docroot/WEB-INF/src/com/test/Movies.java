package com.test;

import java.io.IOException;
import java.util.List;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.omertron.themoviedbapi.MovieDbException;
import com.omertron.themoviedbapi.TheMovieDbApi;
import com.omertron.themoviedbapi.model.config.Configuration;
import com.omertron.themoviedbapi.model.movie.MovieInfo;
import com.omertron.themoviedbapi.results.ResultList;

import interfaces.Initializer;

/**
 * Portlet implementation class Movies
 */
public class Movies extends MVCPortlet implements Initializer<Movies> {

	
	
	private static String JSP_VIEW = "/html/movies/view.jsp";
	private Log logger;
	
	public Movies() {
		initialize(this);
	}
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {
		TheMovieDbApi mdb = null;
		List<MovieInfo> listmovie=null;
		MovieInfo newsMovies = null;
		String url="";
		try {
			mdb = new TheMovieDbApi("d0c291727655d6d9e9d819ff92b4d829");
			ResultList<MovieInfo> list = mdb.getPopularMovieList(1, "IT");
			newsMovies = mdb.getLatestMovie();
			listmovie = list.getResults();
			for (MovieInfo movie : listmovie) {
				logger.info(movie.toString());
				String posterPath = movie.getPosterPath();
				logger.info("Poster: " + posterPath);
				logger.info("URL immagine: " + mdb.createImageUrl(posterPath, "w780"));
				logger.info("url IMMAGINE: "+url);
				url = getBaseURLConfigurations(mdb);
			}
		} catch (MovieDbException e) {
			logger.error("ERRORE: "+e.getMessage());
			e.printStackTrace();
		}

		// ResultsMap<String, List<Certification>> movies =
		// mdb.getMoviesCertification();
		// Map<String, List<Certification>> mapMovies = movies.getResults();
		// System.out. println("films n°"+mapMovies.size());
		// Set<String> keyset = mapMovies.keySet();
		// for (String string : keyset) {
		// List<Certification> listCer = mapMovies.get(string);
		// for (Certification cert : listCer) {
		// System.out.println(cert.getValue());
		// }
		// }
		renderRequest.setAttribute("top20movies", listmovie);
		renderRequest.setAttribute("newsMovies", newsMovies);
		renderRequest.setAttribute("url", url+"w154");
		logger.info("Vado alla pagina"+JSP_VIEW);
		include(JSP_VIEW, renderRequest, renderResponse);
	}

	/**
	 * Fornisce l'url di base per le immagini
	 * @param mdb
	 * @return
	 * @throws MovieDbException
	 */
	private String getBaseURLConfigurations(TheMovieDbApi mdb) throws MovieDbException {
		Configuration config = mdb.getConfiguration();
		logger.info(config.toString());
		logger.info("URL BASE IMMAGINI: "+config.getBaseUrl());
		return config.getBaseUrl();
		
	}

	@Override
	public void initialize(Movies t) {
		logger= LogFactoryUtil.getLog(t.getClass());
	}
	
	public static void main(String ...strings){
		Movies a = new Movies();
		try {
			a.doView(null, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
}
