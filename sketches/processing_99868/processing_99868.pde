
class Ball
{
  float  x, y, diameter;
  float ySpeed;
  float xSpeed;
  float xDirection = 1;
  float yDirection = 1;
  color ballColor  ;


  Ball(float xpos, float ypos, float dia)
  {
    x = xpos ; 
    y = ypos ; 

    diameter = dia ;
  }

  void display()
  {
    fill(ballColor);
    ellipse(x, y, diameter, diameter);
  }

  void move()
  {
   
    y = y  +  ySpeed * yDirection;
    x = x  +  xSpeed * xDirection;

    if ((y > height ) || (y < 10 ))
      yDirection *= -1;  
    if ((x > width ) || (x <  10))
      xDirection *= -1 ;
  }
  
  float getX() {
    return x; 
  }
  
   float getY() {
    return y; 
  }
  
}


