
public class Cell {
  PImage cell;
  float x;
  float y;
  float attract;
  float minDist = 150.0;
  
  public Cell(float ix,float iy, float iattract) {
    cell = loadImage("Cell.png");
    x = iy;
    y = iy;
    attract = iattract;
  }
  
  void run(float react) {
    float difx = mouseX - x - cell.width/2;
    if(abs(difx) > 1.0) {
      x = x + ((difx/attract)*react);
      x = constrain(x, 0, width-cell.width);
    }
    
    float dify = mouseY - y - cell.height/2;
    if(abs(dify) > 1.0) {
      y = y + ((dify/attract)*react);
      y = constrain(y, 0, height-cell.height);
    }
    
    image(cell, x, y);
  }
}

