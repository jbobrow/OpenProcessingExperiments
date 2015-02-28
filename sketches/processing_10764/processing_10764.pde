
public class Hair
{
  PVector pos;
  float angle , angleMod;
  float distance;

  Hair()
  {
    pos = new PVector(random(width),random(height));
    distance = random(8,20);
    angle = map(dist(pos.x,pos.y,width/2,height/2),0,400,0,2*TWO_PI);
    angleMod = new Float(angle);
  }

  public void draw()
  {
    float a = angle + angleMod;
    PVector p2 = new PVector(pos.x + distance*sin(a) , pos.y + distance*cos(a));
    beginShape();
    stroke(100,0,0,0);
    vertex(pos.x,pos.y);

    stroke(100,100,0,60);
    vertex(p2.x,p2.y);
    endShape();
  }

  void setAngle(float ang)
  {
    angleMod=ang;
  }

}

