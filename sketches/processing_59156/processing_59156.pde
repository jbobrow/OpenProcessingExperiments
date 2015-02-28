
public class CheckBox
{
  private final int SIDE = 10;
  public float x, y;
  private String _title;
  private boolean _checked;
  
  public CheckBox(String title, boolean checked)
  {
    _checked = checked;
    _title = title;
  }
  
  public void display()
  {
    stroke(255);
    line(x, y, x + SIDE, y);
    line(x + SIDE, y, x + SIDE, y + SIDE);
    line(x + SIDE, y + SIDE, x, y + SIDE);
    line(x, y + SIDE, x, y);
    
    PFont font = createFont("Calibri", 13);
    textFont(font);
    text(_title, x + SIDE + 5, y + SIDE);
    
    if(_checked)
    {
      fill(255);
      rect(x, y, SIDE, SIDE);
    }
  }
  
  public void setSelected()
  {
    if(mouseX > x && mouseX < x + SIDE && mouseY > y && mouseY < y + SIDE)
      _checked = !_checked;
  }
  
  public boolean checked()
  {
    return _checked;
  }
}

