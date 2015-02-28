
class Card {
float d,r,xpos,ypos,sy,my,ey;
boolean aA;


  Card( 
    float dia,
    float rad,

    float x,
    float y,
    float startY,
    float midY,
    float endY,

    boolean animationA)
    {
      d = dia;
      r = rad;
      xpos = x;
      ypos = y;
      sy = startY;
      my = midY;
      ey = endY;
      aA = animationA;  
  }

  void display()
  {
    fill(220, 220, 220);
    ellipse(xpos, ypos, d, d);
    fill(255);
  }

  void work()
  {
    if (mousePressed == true
      && mouseX < xpos + r && mouseX > xpos - r
      && mouseY < ypos + r && mouseY > ypos - r)
    {
      aA = true;
  }
  }
}


