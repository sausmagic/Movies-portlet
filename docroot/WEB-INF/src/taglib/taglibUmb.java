package taglib;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class taglibUmb extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

private String mFormat;
    
    public void setFormat(String pFormat) {
        mFormat = pFormat;
    }
    
    
    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            Date today = new Date();
            SimpleDateFormat dateFormatter = new SimpleDateFormat(mFormat);
            out.print("info recuperate: "+dateFormatter.format(today));
            
        } catch(IOException ioe) {
            throw new JspException("Error: " + ioe.getMessage());
        }       
        return EVAL_PAGE;
    }
    
    
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }
    
	public static String testMethod(TagLibBean object,String text, int number, boolean logic) {
		return object.testMethod(text, number, logic);
	}
}
