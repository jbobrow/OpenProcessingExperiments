
class Spiro
{
  PVector origin;
  float r;
  float a, aInc;
  
  Spiro(PVector o_, float r_, float a_)
  {
    origin = o_;
    r = r_;
    a = 0.0;
    aInc = a_;
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    a+=aInc;
  }
  
  void render()
  {
    stroke(255);
    strokeWeight(0.5);
    noStroke();
    fill(map(origin.x, -300, 300, 0, 255), map(origin.y, -300, 300, 0, 255), 96, 192);
    ellipse(origin.x, origin.y, r*2, r*2);
    
    stroke(255, 192);
    strokeWeight(0.5);
    for (float f=0; f<TWO_PI; f+=TWO_PI/50)
    {
      line(origin.x+cos(f+a)*30, origin.y+sin(f+a)*30, origin.x+cos(f+a)*r, origin.y+sin(f+a)*r);
    }
  }
  
  void setOrigin(float x_, float y_)
  {
    origin.x = x_;
    origin.y = y_;
  }
}

