
class Bullet
{
  private PVector loc = new PVector();
  private float angle;
  private Cannon c;
  private int age = 0;
  PVector center;
  PVector turret;
  public Bullet(Cannon c, float x, float y)
  {
    this.c = c;
    loc.x = x;
    loc.y = y;
    center = new PVector(c.loc.x,c.loc.y);
    turret = new PVector(c.cX,c.cY);
  }
  void run()
  {
    noStroke();
    fill(200);
    ellipse(loc.x,loc.y,10,10);
    PVector vel = PVector.sub(turret,center);
    loc.add(new PVector(vel.x/15,vel.y/15));
    age++;
    if (age>100)  bullets.remove(this);
  }
}

