
public class ColorObject {
  private int   x, y;
  private Color col;
  private int   wid = 20;
  private int   id;
  
  public ColorObject(int x, int y, int id) {
    this.x = x;
    this.y = y;
    this.id = id;
    col = new Color(#666666);
  }
  
  public void update() {
    noStroke();
    fill(col.getRGB());
    rect(x,y,wid,wid);
  }
  
  public void setColor(Color c) {
    this.col = c;
  }
  
  public void mouseEvent(MouseEvent event) {
    if (event.getID() == MouseEvent.MOUSE_RELEASED) {
      if ((mouseX >= x) && (mouseX <= x+wid) && (mouseY >= y) && (mouseY <= y+wid)) {
        setSelectedColorObject(this);
      }
    }
  }
}
 


