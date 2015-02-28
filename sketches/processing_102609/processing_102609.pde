
class HockeyMallet extends HockeyObj 
{
  public float r = 30;
  HockeyMallet(PVector loc, PVector vel)
  {
    super(loc, vel);
  }
  
  void update()
  {
    loc.x = mouseX;
    loc.y = mouseY;
    vel.x = constrain(mouseX - pmouseX,-15,15);
    vel.y = constrain(mouseY - pmouseY,-15,15);
    borders();
    fill(231, 76, 6);
    ellipse(loc.x, loc.y,r*2,r*2);
  }
}


