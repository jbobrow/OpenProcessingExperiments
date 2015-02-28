
class Egypt
{

  float x, y;
  float xspeed, yspeed;
  float xdir, ydir;
  float r;
  
 Egypt()
  {
    x = random(width);
    y = random (height);
    xspeed = random(-5, 5);
    yspeed = random(-5, 5);
    r = 10; 
  }
  
  void update()
  {
    x += xspeed;
    y += yspeed;
    if((x >= width) || (x >= 0))
      xspeed *= -1;
    if((y >= height) || (y <=0))
      yspeed *= -1;
  }
  
  void display()
  {
    stroke(255);
    fill(0);
    triangle(x, 320, 250,y, 375,320);
    line(180,320, r*2,r*2);
    line(250,320, 312,y);
  }
}


