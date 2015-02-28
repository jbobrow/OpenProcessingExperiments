
class Blocker {
  int x,y; //Position on the grid
  int w,h; //width and height of the blocker
  
  public Blocker(int x,int y)
  {
    this.x=x;
    this.y=y;
    w=50;
    h=70;
  }
  public void draw()
  {
    rectMode(CENTER);
    fill(0,0,255);
    rect(x,y,w,h);
  }
  boolean collision(Bullet b)
  {
    if(b.x > x-w/2 && b.x < x+w/2)
      if(b.y > y-h/2 && b.y < y+h/2)
        return true;
    return false;
  }
}

