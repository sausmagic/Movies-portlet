package taglib;

public class TagLibBean {

	private String text;
    private int number;
    private boolean logic;
    public TagLibBean() {
        text = "";
        number = 0;
        logic = false;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public int getNumber() {
        return number;
    }
    public void setNumber(int number) {
        this.number = number;
    }
    public boolean getLogic() {
        return logic;
    }
    public void setLogic(boolean logic) {
        this.logic = logic;
    }
    public String testMethod(String text, int number, boolean logic) {
        setText(getText() + text);
        setNumber(getNumber() + number);
        setLogic(getLogic() || logic);
        StringBuffer buf = new StringBuffer();
        buf.append(getText());
        buf.append(' ');
        buf.append(getNumber());
        buf.append(' ');
        buf.append(getLogic());
        return buf.toString();
    }
}
