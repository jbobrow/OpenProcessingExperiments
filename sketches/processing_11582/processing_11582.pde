
class Ball {
  float x, y, diameter, origDiameter;
  int fillColor;
  
  Ball(float xpos, float ypos, float diam, int clr)
  {
    x = xpos;
    y = ypos;
    diameter = diam;
    origDiameter = diam;
    fillColor = clr;
  }
  
  void scaleIt(float newScale)
  {
    // scale(newScale);
    diameter = origDiameter * newScale;
  }

  void display() 
  {
    fill(fillColor, 200);
    strokeWeight(0.5);
    ellipse(x, y, diameter, diameter);
  } 
}

