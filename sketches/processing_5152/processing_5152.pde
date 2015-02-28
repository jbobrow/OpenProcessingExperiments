
class Attractor
{
  PVector position = new PVector(width/2, height/2);
  float strength = 1;
  
  
  public Attractor() { }
  
  public Attractor(PVector position, float strength)
  {
    this.position = position;
    this.strength = strength;
  }
  
  float getRadius()
  {
    return 2+strength;
  }
  
  
  void draw()
  {
    noStroke();
    fill(0);
    float radius = getRadius();
    ellipse(position.x,position.y,radius, radius);
  }
}

