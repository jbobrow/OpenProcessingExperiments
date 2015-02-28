
class Gondola
{
  float x,y;

  Gondola()
  {}
  void move(float x,float y)
  {
    this.x=x;
    this.y=y;
  }
  void draw ()
  {
  this.draw (false);
  }
  
  void draw(boolean espejo)
  {
    pushMatrix();
    translate (x,y);
    if (espejo)
      scale (-1,1);
    fill(131,127,110);
    strokeWeight (1);
    stroke(0);
    ellipse(12,6,40,10);
    ellipse(13,5,30,3);
    line (14,4,27,0);
    line (20,15,10,5);
    popMatrix();
  }
}


