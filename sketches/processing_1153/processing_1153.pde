

class CircleMouse
{

  CircleMouse()
  {
    colorMode(RGB,255,255,255,100);
    strokeWeight(0);
  }
  
  void display()
  {
    fill(random(255),random(255),random(255),random(100));
    ellipse(mouseX,mouseY,random(100),random(100));
  }
}


