
class Particle
{
  PVector cen;
  PVector pos;
  PVector rad;
  float ang;
 
  Particle(PVector c, PVector r, float a)
  {
    cen = c.get();
    rad = r.get();
    pos = new PVector(cen.x+cos(a),cen.y+sin(a));
    ang = a;
  }
  
  void transform(PVector r)
  {
    
  }
  
  void turn(float deltaAng)
  {
    ang -= deltaAng;
    ang -= 2.0*PI*floor(0.5*ang/PI);
    pos.x = cen.x + sin(ang) * rad.x;
    pos.y = cen.y + cos(ang) * rad.y;
  }
  
  void render()
  {
    stroke(255*(1-pos.y/deep),255*(1-pos.y/deep),255);
    strokeWeight(2);
    point(pos.x, pos.y);
  }
}

