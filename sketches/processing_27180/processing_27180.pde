
public class Bullet 
{
  int x, y, vx;
  int bulletPierce = 2;

  Bullet(int x, int y, int vx) 
  {
    if(thePlayer.facingRight == false)
    {
      this.x = (int)thePlayer.position.x-45;
    }
    else if(thePlayer.facingRight == true)
    {
      this.x = (int)thePlayer.position.x+45;
    }
    this.y = (int)thePlayer.position.y-54;
    this.vx = vx;
  }
  

  void show() 
  {
    x += vx;
    fill(255,255,0);
    ellipse(x, y, 4, 4);
  }
}


