
class ball
{
  float a, b;
  int speed, speed2;


  void show()
  {

    imageMode (CENTER);


    if (b > 700)
    {
      b = (int)random(-250,-50);
      life = life - 1;
      if( life == 0)
      {
        life = life;
        screenNumber = 3;
      }
      a = random(700);
    }
    b += speed;
    
    if (screenNumber == 1)
    {
      b = -100;
    }
    if (screenNumber == 3)
    {
      b = -100;
      a = -200;
    }
  }
  
  void nothing()
  {
    b = random(-250,-50);
      a = -200;
  }
  
  void show2()
  {
    if (screenNumber == 1)
    {
      a = random(width);
    }
  }
  
 void checkCollisionJelly()
  {  
    if(dist(x,y,a,b)<(50))
    {
      b = -100;
      a = random(5,695);
      score = score +1;
    }
  }
  
  void charInside()
  {
    if( x > width-5 ) x = width;
    if( y > height ) y = height;
    if( x < 2 ) x = 2;
    if( y < 2 ) y = 2;
  }
} // end of class



void keyPressed()
{
  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN ) downPressed = true;
  if (keyCode == LEFT ) leftPressed = true;
  if (keyCode == RIGHT ) rightPressed = true;
  if (key == 'r' ) rPressed = true;
}

void keyReleased()
{
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN ) downPressed = false;
  if (keyCode == LEFT ) leftPressed = false;
  if (keyCode == RIGHT ) rightPressed = false;
  if (key == 'r' ) rPressed = false;
}


