
class EyeWheel
{ 
  float x, y;
  float d;
  int R, G, B;
  float angle = 0;
  
  EyeWheel(float _x, float _y, float _d, int _R, int _G, int _B)
  {
    x = _x;
    y = _y;
    d = _d;
    R = _R;
    G = _G;
    B = _B;
  }
  
  void drawEyeWheel()
  {
    fill(255, 255, 255, 0);
    ellipse(x, y, d, d);
    
    eyefxn(x, y-d, R, G, B);
    eyefxn(x, y+d, R, G, B);
    eyefxn(x+d, y, R, G, B);
    eyefxn(x-d, y, R, G, B);
  }
  
  void rotateEyeWheel()
  {
    angle += .008;
    translate(width/2, height/2);
    rotate(angle);
  }
  
  void invEyeWheel()
  {
    if(keyPressed == true)
    {
      filter(INVERT);
      translate(-width/4, -height/4);
      eyefxn(width/2, height/2, 255, 255, 255);
    }
  }
}

