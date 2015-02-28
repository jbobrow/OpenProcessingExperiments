
class Ball
{
  float velocityX; 
  float velocityY;
  float speed = 5;
  float x; 
  float y;
  boolean launched = false;
  float resetY;
  float radius;


  Ball(float X, float Y)
  {
    velocityX = 0; 
    velocityY = 0;
    radius = 12.5;
    x = X;
    y = Y;
    resetY = Y;
  }

  void Move()
  {
    if (launched == false)
    {
      if (mouseX > (player.sizeX/2 + 1) && mouseX < width-(player.sizeX/2 -1))
      {
        x = mouseX;
      }
      y = resetY;
    }
    else
    {
      //collide with walls
         if (x-radius < 0)
        {
          x += radius;
          velocityX *= -1;
        }
        else if (x+radius > width)
        {
          x -= radius;
          velocityX *= -1;
        }
        if (y-radius < 0)
        {
          y += radius;
          velocityY *= -1;
        }
        else if (y+radius > height)
        {
          x = mouseX;
          y = resetY;
          launched = false;
        }
        //collide with paddle
      float L = x - radius;
      float R = x + radius;
      float B = y + radius;
      if (L <= player.x+player.sizeX/2 && R >= player.x-player.sizeX/2)
      {
        if (B>=player.y)
        {
          velocityY *= -1;
          if (x < mouseX)
          {
            velocityX = -1;
          }
          else if (x > mouseX)
          {
            velocityX = 1;
          }
          y = resetY - radius;
          println("collide!");
        }
      }
          x += velocityX * speed;
         y += velocityY;
    }

  }

  void Appear()
  {
    stroke(random(255),random(255),random(255));
    fill(random(255), random(255), random(255), random(50));
    pushMatrix();
    translate(x,y);
     rotate(radians(random(360)));
     translate(-x,-y);
    rect(x,y,radius*2,radius*2);
    popMatrix();
  }
  
}


