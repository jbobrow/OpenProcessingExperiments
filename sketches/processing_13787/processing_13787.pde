
class Button
{
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  String label = "";
  
  float points = 16;
  
  int align = CENTER;
  
  Button(String iLab, float ix, float iy, float iw, float ih)
  {
    label = iLab;
    x = ix;
    y = iy;
    w = iw;
    h = ih;
  }
  
  void display()
  {
    stroke(255);
    strokeWeight(1);
    noFill();
    rect(x, y, w, h);
    
    textAlign(align);
    fill(255);
    textFont(OCRA, points);
    switch(align)
    {
      case LEFT:
        text(label, x, y + (h + points) / 2);
        break;
      case CENTER:
        text(label, x + w / 2, y + h / 2 + points / 4);
        break;
      case RIGHT:
        text(label, x + w, y + (h + points) / 2);
        break;
    }
  }
  
  boolean hit()
  {
    return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
  }
}

