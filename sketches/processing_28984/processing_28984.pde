
class Asteroid //base asteroid used for other
{
  float x = 0, y = 0, size = 15;
  float xSpeed = 0, ySpeed = 0;// check so they will allways move
  color c = color(255, 0, 0);
  
  void draw()
  {
     fill(c);
     if(time_stop)
     {
       x += 0;
       y += 0;
     }
     else
     {
       x += xSpeed;
       y += ySpeed;
     }
     ellipse(x, y, size, size);
  }
}

