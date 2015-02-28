
class AnimCircle extends AnimShape {
  
  AnimCircle(float x1, float y1, float w1, float h1, color c1,
  float a1, float x2, float y2, float w2, float h2, color c2,
  float a2) {
    super(x1, y1, w1, h1, c1, a1,
      x2, y2, w2, h2, c2, a2);
  }
    
  void displayShape(float x, float y, float w, float h)
  {
    ellipse(x, y, w, h);
  }
}


